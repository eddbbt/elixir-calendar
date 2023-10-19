defmodule CalendarTest.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :description, :string
    field :title, :string
    field :starting_date, :utc_datetime
    field :end_date, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :starting_date, :end_date])
    |> validate_required([:title, :starting_date, :end_date])
    |> validate_length(:title, min: 5)
  end
end
