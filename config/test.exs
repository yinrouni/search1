use Mix.Config

# Configure your database
config :search1, Search1.Repo,
  username: "search1",
  password: "ooph4Thul5aF",
  database: "search1_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :search1, Search1Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
