defmodule QuantumSwarmTest do
  @moduledoc false

  use ExUnit.Case, async: false

  import Crontab.CronExpression

  alias Quantum.Job
  alias QuantumSwarm.Test.Scheduler

  test "works when multiple started at the same time" do
    nodes =
      LocalCluster.start_nodes("run-same-time", 3,
        files: [
          __ENV__.file
        ]
      )

    caller = self()

    for node <- nodes do
      Node.spawn(node, fn ->
        {:ok, _} = Application.ensure_all_started(:swarm)

        {:ok, pid} = Scheduler.start_link()

        Scheduler.new_job()
        |> Job.set_name(node)
        |> Job.set_schedule(~e[*]e)
        |> Scheduler.add_job()

        send(caller, {:started, node, pid})

        assert_receive {:DOWN, _ref, _method, pid, :shutdown}, 30_000
      end)
    end

    for node <- nodes do
      assert_receive {:started, ^node, _scheduler_pid}, 30_000

      assert %Job{name: ^node} = Scheduler.find_job(node)
    end
  end
end
