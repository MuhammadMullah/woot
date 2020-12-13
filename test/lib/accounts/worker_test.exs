defmodule Woot.WorkerTest do
  use ExUnit.Case

  alias Woot.Worker
  alias Woot.State

  setup do
    Application.stop(:woot)
    Process.sleep(4)

    :ok = Application.start(:woot)
  end

  describe "Worker" do
    test "show_users/0 returns a list of all users in state" do
      state = %State{}
      assert Worker.show_users() == state
      assert state.timestamp == nil
      assert state.users == []
    end
  end
end
