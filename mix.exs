defmodule QuantumSwarm.MixProject do
  @moduledoc false

  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :quantum_swarm,
      elixir: "~> 1.9",
      description: "Swarm Clusering for Quantum",
      start_permanent: Mix.env() == :prod,
      docs: docs(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      version: @version,
      build_embedded:
        Mix.env() == :prod or (System.get_env("BUILD_EMBEDDED") || "false") in ["1", "true"],
      aliases: [
        test: "test --no-start"
      ],
      dialyzer:
        [
          ignore_warnings: "dialyzer.ignore-warnings"
        ] ++
          if (System.get_env("DIALYZER_PLT_PRIV") || "false") in ["1", "true"] do
            [
              plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
            ]
          else
            []
          end
    ]
  end

  defp package do
    %{
      maintainers: [
        "Jonatan Männchen"
      ],
      exclude_patterns: [~r[priv/plts]],
      licenses: ["Apache License 2.0"],
      links: %{
        "Changelog" => "https://github.com/quantum-elixir/quantum-swarm/blob/master/CHANGELOG.md",
        "GitHub" => "https://github.com/quantum-elixir/quantum-swarm"
      }
    }
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: "https://github.com/quantum-elixir/quantum-swarm",
      extras: [
        "README.md",
        "CHANGELOG.md"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:quantum, "~> 3.1"},
      {:swarm, "~> 3.0"},
      {:local_cluster, "~> 1.1", only: [:test]},
      {:ex_doc, "~> 0.19", only: [:dev, :docs], runtime: false},
      {:excoveralls, "~> 0.5", only: [:test], runtime: false},
      {:dialyxir, "~> 1.0-rc", only: [:dev], runtime: false},
      {:credo, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end
