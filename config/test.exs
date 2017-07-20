use Mix.Config

config :has_many_through, HasManyThrough.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "has_many_through_test",
  username: "has_many_through",
  password: "exs#exs456",
  hostname: "has-many-through-postgres-s",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
