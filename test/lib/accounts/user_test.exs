defmodule Woot.Accounts.UserTest do
  @moduledoc false
  use Woot.DataCase

  alias Ecto.Changeset
  alias Woot.Accounts.User

  @valid_attrs %{points: 2}

  describe "user changeset" do
    test "success: returns a valid changeset with valid attributes" do
      # testing whether is_integer(:points) == true that is already
      # taken care by ecto so we won't bother test.
      changeset = User.changeset(%User{}, @valid_attrs)
      assert %Changeset{valid?: true, changes: changes} = changeset
    end
  end
end
