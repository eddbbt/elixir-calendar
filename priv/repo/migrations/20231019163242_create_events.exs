defmodule CalendarTest.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :string
      add :starting_date, :naive_datetime
      add :end_date, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
