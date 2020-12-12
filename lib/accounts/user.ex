defmodule Woot.Accounts.User do
  @moduledoc """
    User Schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:points]

  schema "users" do
    field :points, :integer, default: 0
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:points])
    |> validate_required(@required_fields)
    |> validate_number(:points, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
  end
end
