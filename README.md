# ExRegon

**Elixir library for REGON number.**

  * `ExRegon.valid?/1` - you can check if REGON number is valid

  More about REGON number:
  * [Wikipedia PL](https://pl.wikipedia.org/wiki/REGON)

## Usage

```elixir
iex> ExRegon.valid?("390170518")
true

iex> ExRegon.valid?("859222088")
false

iex> ExRegon.valid?("39017051841250")
true

iex> ExRegon.valid?("39016051841250")
false
```

## Installation

Package can be installed by adding `ex_regon`
to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_regon, "~> 0.1.0"}
  ]
end
```

## Documentation

Docs can be found at [https://hexdocs.pm/ex_regon](https://hexdocs.pm/ex_regon).

## License

Source code of ex_regon is released under the Apache 2.0 license, see the [LICENSE](LICENSE) file.
