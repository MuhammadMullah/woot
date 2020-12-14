defmodule Woot.Worker do
  @moduledoc """
  Implementation of a GenServer to hold our initial state of max_number and timestamps struct.
  max_number starts as a random number ranging between 0-100 with timestamps starting as nil.
  """
  use GenServer
  alias Woot.State
  alias Woot.Accounts

  @name __MODULE__

  # Client

  @doc """
  Responsible for starting our GenSever with a name option and an empty state
  """
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: @name)
  end

  def show_users do
    GenServer.call(@name, :show)
  end

  def fetch_points do
    GenServer.call(@name, :fetch)
  end

  # Server Callbacks

  @impl true
  def init(_) do
    # schedule to run after every 1 minute
    scheduler()
    {:ok, %State{}}
  end

  @impl true
  def handle_call(:show, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:fetch, _from, state) do
    users = Accounts.fetch_points(state.max_number)
    timestamp = DateTime.utc_now() |> DateTime.to_unix()

    # return state with users who have more points than max_number
    {:reply, %{users: state.users, timestamp: state.timestamp},
     %{state | users: users, timestamp: timestamp}}
  end

  @impl true
  def handle_info(:work, state) do
    update_points()
    # after every one minute, we update genserver state with new random points
    scheduler()
    {:noreply, %{state | max_number: Enum.random(0..100)}}
  end

  defp scheduler do
    Process.send_after(self(), :work, 60_000)
  end

  defp update_points do
    Accounts.list_users()
    |> Enum.each(fn user -> Accounts.update_user(user, %{points: Enum.random(0..100)}) end)
  end
end
