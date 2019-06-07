defmodule PhoenixBenchWeb.BenchmarkView do
  use PhoenixBenchWeb, :view
  alias PhoenixBenchWeb.BenchmarkView

  def render("index.json", %{benchs: benchs}) do
    %{data: render_many(benchs, BenchmarkView, "benchmark.json")}
  end

  def render("show.json", %{benchmark: benchmark}) do
    %{data: render_one(benchmark, BenchmarkView, "benchmark.json")}
  end

  def render("benchmark.json", %{benchmark: benchmark}) do
    %{id: benchmark.id}
  end
end
