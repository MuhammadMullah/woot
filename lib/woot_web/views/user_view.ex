defmodule WootWeb.UserView do
  @moduledoc false
  use WootWeb, :view
  alias WootWeb.UserView

  def render("index.json", %{state: state}) do
    {:ok, d} = DateTime.from_unix(state.timestamp, :second)

    %{
      users: render_many(state.users, UserView, "user.json"),

      # https://elixirforum.com/t/datetime-format-to-string/1698/4
      timestamp: "#{d.year}-#{d.month}-#{d.day} #{d.hour}:#{d.minute}:#{d.second}"
    }
  end

  def render("user.json", %{user: user}) do
    IO.inspect(user)
    user
  end
end
