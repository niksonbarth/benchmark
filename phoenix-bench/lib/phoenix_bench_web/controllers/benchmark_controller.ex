defmodule BenchmarkController do
  use PhoenixBenchWeb, :controller

  action_fallback PhoenixBenchWeb.FallbackController

  def bench(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{"message" => fib(15)})
  end

  defp fib(number) when number <= 1 do
    number
  end

  defp fib(number) do
    fib(number - 1) + fib(number - 2)
  end
end
