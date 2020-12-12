defmodule Woot.Repo do
  use Ecto.Repo,
    otp_app: :woot,
    adapter: Ecto.Adapters.Postgres
end
