defmodule CalendarTest.Repo do
  use Ecto.Repo,
    otp_app: :calendar_test,
    adapter: Ecto.Adapters.Postgres
end
