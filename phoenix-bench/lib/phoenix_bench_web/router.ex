defmodule PhoenixBenchWeb.Router do
  use PhoenixBenchWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    get "/bench", BenchmarkController, :bench
  end
end
