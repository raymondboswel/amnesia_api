use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :amnesia_api, AmnesiaApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :info

# Configure your database
config :amnesia_api, AmnesiaApi.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "travis",
  password: "",
  database: "amnesia_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
