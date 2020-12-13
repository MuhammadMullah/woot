defmodule WootWeb.UserController do
  @moduledoc false
  use WootWeb, :controller
  alias Woot.Worker

  def index(conn, _) do
    state = Worker.fetch_points()
    render(conn, "index.json", state: state)
  end
end
