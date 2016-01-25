# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :i_ching, IChing.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "/GI1Oy19ViJ0TRPbu+Vtn97bZPiP/JoIHuSSnAojBeouFEKXDFD+rv3LuKIQ+xo/",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: IChing.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false


config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

config :apples_and_oranges, static_app: :i_ching
config :apples_and_oranges, port: 1985
config :apples_and_oranges, router: ApplesAndOranges.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
