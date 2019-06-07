defmodule BenchmarkController do
  use PhoenixBenchWeb, :controller

  action_fallback PhoenixBenchWeb.FallbackController

  def bench(conn, _params) do
    Process.sleep(Enum.random(1..10000))

    conn
    |> put_status(200)
    |> json(%{"message" => :ok})
  end
end
