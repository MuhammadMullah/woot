defmodule Woot.Accounts.AccountsTest do
  use Woot.DataCase

  alias Woot.Accounts

  describe "accounts" do
    alias Woot.Accounts.User

    test "list_users/0 returns all users" do
      user = insert!(:user)
      assert Accounts.list_users() == [user]
    end
  end
end
