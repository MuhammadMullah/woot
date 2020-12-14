defmodule WootWeb.UserView do
  @moduledoc false
  use WootWeb, :view
  alias WootWeb.UserView

  def render("index.json", %{state: state}) do
    %{
      users: render_many(state.users, UserView, "user.json"),

      # https://elixirforum.com/t/datetime-format-to-string/1698/4
      timestamp: get_datestring(state.timestamp)

    }
  end

  def render("user.json", %{user: user}) do
    IO.inspect user
    user
  end


  defp get_datestring(nil), do: ""

  defp get_datestring(timestamp) do
    d = DateTime.from_unix!(timestamp, :second)
    "#{d.year}-#{d.month}-#{d.day} #{d.hour}:#{d.minute}:#{d.second}"
  end
end
