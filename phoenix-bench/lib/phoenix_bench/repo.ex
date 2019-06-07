defmodule PhoenixBench.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_bench,
    adapter: Ecto.Adapters.Postgres
end
