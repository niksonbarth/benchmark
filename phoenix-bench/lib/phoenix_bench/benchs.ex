defmodule PhoenixBench.Benchs do
  @moduledoc """
  The Benchs context.
  """

  import Ecto.Query, warn: false
  alias PhoenixBench.Repo

  alias PhoenixBench.Benchs.Benchmark

  @doc """
  Returns the list of benchs.

  ## Examples

      iex> list_benchs()
      [%Benchmark{}, ...]

  """
  def list_benchs do
    Repo.all(Benchmark)
  end

  @doc """
  Gets a single benchmark.

  Raises `Ecto.NoResultsError` if the Benchmark does not exist.

  ## Examples

      iex> get_benchmark!(123)
      %Benchmark{}

      iex> get_benchmark!(456)
      ** (Ecto.NoResultsError)

  """
  def get_benchmark!(id), do: Repo.get!(Benchmark, id)

  @doc """
  Creates a benchmark.

  ## Examples

      iex> create_benchmark(%{field: value})
      {:ok, %Benchmark{}}

      iex> create_benchmark(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_benchmark(attrs \\ %{}) do
    %Benchmark{}
    |> Benchmark.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a benchmark.

  ## Examples

      iex> update_benchmark(benchmark, %{field: new_value})
      {:ok, %Benchmark{}}

      iex> update_benchmark(benchmark, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_benchmark(%Benchmark{} = benchmark, attrs) do
    benchmark
    |> Benchmark.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Benchmark.

  ## Examples

      iex> delete_benchmark(benchmark)
      {:ok, %Benchmark{}}

      iex> delete_benchmark(benchmark)
      {:error, %Ecto.Changeset{}}

  """
  def delete_benchmark(%Benchmark{} = benchmark) do
    Repo.delete(benchmark)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking benchmark changes.

  ## Examples

      iex> change_benchmark(benchmark)
      %Ecto.Changeset{source: %Benchmark{}}

  """
  def change_benchmark(%Benchmark{} = benchmark) do
    Benchmark.changeset(benchmark, %{})
  end
end
