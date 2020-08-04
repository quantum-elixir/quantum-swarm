# QuantumSwarm

[![Financial Contributors on Open Collective](https://opencollective.com/quantum/all/badge.svg?label=financial+contributors)](https://opencollective.com/quantum)
[![Hex.pm Version](http://img.shields.io/hexpm/v/quantum_swarm.svg)](https://hex.pm/packages/quantum_swarm)
[![Hex docs](http://img.shields.io/badge/hex.pm-docs-green.svg?style=flat)](https://hexdocs.pm/quantum_swarm)
![.github/workflows/elixir.yml](https://github.com/quantum-elixir/quantum-swarm/workflows/.github/workflows/elixir.yml/badge.svg)
[![Coverage Status](https://coveralls.io/repos/quantum-elixir/quantum-swarm/badge.svg?branch=master)](https://coveralls.io/r/quantum-elixir/quantum-swarm?branch=master)
[![Hex.pm](https://img.shields.io/hexpm/dt/quantum_swarm.svg)](https://hex.pm/packages/quantum_swarm)

> **This README follows master, which may not be the currently published version**. Here are the
[docs for the latest published version of Quantum Swarm](https://hexdocs.pm/quantum_swarm/readme.html).


Very simple [`swarm`](https://hex.pm/packages/swarm) clustering adapter for
[`quantum`](https://hex.pm/packages/quantum).

:warning: :warning: **This adapter does not support process handoff. Therefore it is vital that a persistent storage is used.**

## Installation

The package can be installed by adding `quantum_swarm` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:quantum_swarm, "~> 1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). The docs can be found at
[https://hexdocs.pm/quantum_swarm](https://hexdocs.pm/quantum_swarm).

