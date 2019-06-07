defmodule PhoenixBench.Benchs.Benchmark do
  use Ecto.Schema
  import Ecto.Changeset

  schema "benchs" do

    timestamps()
  end

  @doc false
  def changeset(benchmark, attrs) do
    benchmark
    |> cast(attrs, [])
    |> validate_required([])
  end
end
