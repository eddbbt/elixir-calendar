defmodule CalendarTest.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CalendarTest.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_date: ~N[2023-10-18 16:32:00],
        starting_date: ~N[2023-10-18 16:32:00],
        title: "some title"
      })
      |> CalendarTest.Events.create_event()

    event
  end
end
