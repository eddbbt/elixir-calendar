defmodule CalendarTestWeb.EventControllerTest do
  use CalendarTestWeb.ConnCase

  import CalendarTest.EventsFixtures

  @create_attrs %{
    description: "some description",
    title: "some title",
    starting_date: ~N[2023-10-18 16:32:00],
    end_date: ~N[2023-10-18 16:32:00]
  }
  @update_attrs %{
    description: "some updated description",
    title: "some updated title",
    starting_date: ~N[2023-10-19 16:32:00],
    end_date: ~N[2023-10-19 16:32:00]
  }
  @invalid_attrs %{description: nil, title: nil, starting_date: nil, end_date: nil}

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, ~p"/events")
      assert html_response(conn, 200) =~ "Listing Events"
    end
  end

  describe "new event" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/events/new")
      assert html_response(conn, 200) =~ "New Event"
    end
  end

  describe "create event" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/events", event: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/events/#{id}"

      conn = get(conn, ~p"/events/#{id}")
      assert html_response(conn, 200) =~ "Event #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/events", event: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Event"
    end
  end

  describe "edit event" do
    setup [:create_event]

    test "renders form for editing chosen event", %{conn: conn, event: event} do
      conn = get(conn, ~p"/events/#{event}/edit")
      assert html_response(conn, 200) =~ "Edit Event"
    end
  end

  describe "update event" do
    setup [:create_event]

    test "redirects when data is valid", %{conn: conn, event: event} do
      conn = put(conn, ~p"/events/#{event}", event: @update_attrs)
      assert redirected_to(conn) == ~p"/events/#{event}"

      conn = get(conn, ~p"/events/#{event}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, ~p"/events/#{event}", event: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Event"
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, ~p"/events/#{event}")
      assert redirected_to(conn) == ~p"/events"

      assert_error_sent 404, fn ->
        get(conn, ~p"/events/#{event}")
      end
    end
  end

  defp create_event(_) do
    event = event_fixture()
    %{event: event}
  end
end
