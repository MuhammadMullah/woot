defmodule Woot.Accounts do
  @moduledoc """
    Accounts Context
  """
  import Ecto.Query, warn: false

  alias Woot.Repo
  alias Woot.Accounts.User

  @spec list_users() :: list()
  @spec create_user(map) :: {:error, atom | Ecto.Changeset.t()} | {:ok, User.t()}
  @spec update_user(User.t(), %{optional(atom) => binary}) ::
          {:error, Ecto.Changeset.t()} | {:ok, User.t()}

  @doc """
  Returns the list of Users.
  ## Examples
      iex> list_users()
      [%User{}, ...]
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Creates a user.
  ## Examples
      iex> create_user(%{field: value})
      {:ok, %User{}}
      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  ## Examples
      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}
      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    From our users table we fetch all the users with points greater than
    maximum number
  """
  def fetch_points(max_number) do
    from(u in User, where: u.points > ^max_number, limit: 2) |> Repo.all()
  end
end
