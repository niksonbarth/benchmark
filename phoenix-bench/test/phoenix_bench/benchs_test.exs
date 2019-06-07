defmodule PhoenixBench.BenchsTest do
  use PhoenixBench.DataCase

  alias PhoenixBench.Benchs

  describe "benchs" do
    alias PhoenixBench.Benchs.Benchmark

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def benchmark_fixture(attrs \\ %{}) do
      {:ok, benchmark} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Benchs.create_benchmark()

      benchmark
    end

    test "list_benchs/0 returns all benchs" do
      benchmark = benchmark_fixture()
      assert Benchs.list_benchs() == [benchmark]
    end

    test "get_benchmark!/1 returns the benchmark with given id" do
      benchmark = benchmark_fixture()
      assert Benchs.get_benchmark!(benchmark.id) == benchmark
    end

    test "create_benchmark/1 with valid data creates a benchmark" do
      assert {:ok, %Benchmark{} = benchmark} = Benchs.create_benchmark(@valid_attrs)
    end

    test "create_benchmark/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Benchs.create_benchmark(@invalid_attrs)
    end

    test "update_benchmark/2 with valid data updates the benchmark" do
      benchmark = benchmark_fixture()
      assert {:ok, %Benchmark{} = benchmark} = Benchs.update_benchmark(benchmark, @update_attrs)
    end

    test "update_benchmark/2 with invalid data returns error changeset" do
      benchmark = benchmark_fixture()
      assert {:error, %Ecto.Changeset{}} = Benchs.update_benchmark(benchmark, @invalid_attrs)
      assert benchmark == Benchs.get_benchmark!(benchmark.id)
    end

    test "delete_benchmark/1 deletes the benchmark" do
      benchmark = benchmark_fixture()
      assert {:ok, %Benchmark{}} = Benchs.delete_benchmark(benchmark)
      assert_raise Ecto.NoResultsError, fn -> Benchs.get_benchmark!(benchmark.id) end
    end

    test "change_benchmark/1 returns a benchmark changeset" do
      benchmark = benchmark_fixture()
      assert %Ecto.Changeset{} = Benchs.change_benchmark(benchmark)
    end
  end
end
