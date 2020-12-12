defmodule Woot.Accounts.AccountsTest do
  use Woot.DataCase

  alias Woot.Accounts
  alias Woot.Accounts.User

  @updated_attrs %{points: 30}

  describe "accounts" do
    test "list_users/0 returns all users" do
      user = insert!(:user)
      assert Accounts.list_users() == [user]
    end

    test "create_user/1 with valid data creates a user" do
      user = insert!(:user)
      assert is_integer(user.points) == true
    end

    test "update_user/2 with valid data updates the user" do
      user = insert!(:user)
      assert {:ok, user} = Accounts.update_user(user, @updated_attrs)
      assert %User{} = user
      assert user.points == 30
    end
  end
end
