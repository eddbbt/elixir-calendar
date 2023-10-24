defmodule CalendarTestWeb.EventsController do
  use CalendarTestWeb, :controller

  import Ecto.Query, warn: false
  alias CalendarTest.Repo

  def index(conn, _params) do
    data = CalendarTest.Event.get_all()
    IO.inspect(data)
    render(conn, :index, data: data, layout: false)
  end

  def edit(conn, _params) do
    render(conn, :edit, layout: false)
  end

  def new(conn, _params) do
    render(conn, :new, [])
  end

  def show(conn, _params) do
    render(conn, :show, layout: false)
  end

  def create(conn, _params) do
    render(conn, :create, layout: false)
  end

  def update(conn, _params) do
    render(conn, :update, layout: false)
  end

  def delete(conn, _params) do
    render(conn, :delete, layout: false)
  end
end
