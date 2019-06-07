# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

config :phoenix_bench, PhoenixBench.Repo,
  username: "admin",
  password: "admin",
  database: "teste",
  hostname: "postgres",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

secret_key_base = "31SAnTAd3vKxhLqkf4cv7o/aN5Zt7Xbftx/P859+oYzNUnXN3AMHun2OGPvDtbxB"

config :phoenix_bench, PhoenixBenchWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "8000")],
  secret_key_base: secret_key_base
