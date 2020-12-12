defmodule Woot.Accounts do
  @moduledoc """
    Accounts Context
  """
  import Ecto.Query, warn: false

  alias Woot.Repo
  alias Woot.Accounts.User


  @doc """
  Returns the list of Users.
  ## Examples
      iex> list_users()
      [%User{}, ...]
  """
  def list_users do
    Repo.all(User)
  end
end
