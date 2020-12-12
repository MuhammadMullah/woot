# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :woot,
  ecto_repos: [Woot.Repo]

# Configures the endpoint
config :woot, WootWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/jO+ULz5DwxDwtZHLPKFJ3Rt9Jy9yC3/8xeYNDM/2Pm1jXSLmSlL0+xiVQy+sxpI",
  render_errors: [view: WootWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Woot.PubSub,
  live_view: [signing_salt: "2H4lIggf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
