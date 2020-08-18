defmodule QuantumSwarm do
  @moduledoc """
  Defines a `Swarm` Replicated `Quantum` Scheduler.

  **Quantum has encountered many problemy with Swarm in the past. Therefore this libary is provided
  as is. The maintainers of `Quantum` may not be able to help resolve issues.**

  Instead of this code:

      defmodule MyApp.Scheduler do
        use Quantum, otp_app: :my_app
      end

  Use this:

      defmodule MyApp.Scheduler do
        use QuantumSwarm, otp_app: :my_app
      end
  """

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts], location: :keep do
      @otp_app Keyword.fetch!(opts, :otp_app)

      use Quantum, opts

      @impl Quantum
      def config(opts \\ []) do
        QuantumSwarm.scheduler_config(opts, __MODULE__, @otp_app)
      end

      defoverridable config: 0, config: 1
    end
  end

  @doc false
  def scheduler_config(opts, scheduler, otp_app) do
    opts
    |> Keyword.put_new(:storage_name, {:via, Swarm, Module.concat(scheduler, Storage)})
    |> Keyword.put_new(:task_registry_name, {:via, Swarm, Module.concat(scheduler, TaskRegistry)})
    |> Keyword.put_new(
      :clock_broadcaster_name,
      {:via, Swarm, Module.concat(scheduler, ClockBroadcaster)}
    )
    |> Keyword.put_new(
      :job_broadcaster_name,
      {:via, Swarm, Module.concat(scheduler, JobBroadcaster)}
    )
    |> Keyword.put_new(
      :execution_broadcaster_name,
      {:via, Swarm, Module.concat(scheduler, ExecutionBroadcaster)}
    )
    |> Keyword.put_new(
      :node_selector_broadcaster_name,
      {:via, Swarm, Module.concat(scheduler, NodeSelectorBroadcaster)}
    )
    |> Quantum.scheduler_config(scheduler, otp_app)
  end
end
