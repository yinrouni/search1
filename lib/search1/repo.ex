defmodule Search1.Repo do
  use Ecto.Repo,
    otp_app: :search1,
    adapter: Ecto.Adapters.Postgres
end
