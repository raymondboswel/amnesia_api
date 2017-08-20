# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :amnesia_api,
  ecto_repos: [AmnesiaApi.Repo]

# Configures the endpoint
config :amnesia_api, AmnesiaApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DZKSeRxYnSDcUnjD8RyG2znhjI8oaaI37KLeQDyOHZtTAB9S7CZ/zCv5SD0RfA0x",
  render_errors: [view: AmnesiaApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AmnesiaApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "AmnesiaApi",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "d3tz6o3UkRYED94cNMXGBS3wmP07ajRzv+4SaXRY5RFsHwmph5J9UjPmTVOp0SUc",
  serializer: AmnesiaApi.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
