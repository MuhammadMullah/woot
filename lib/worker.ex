defmodule Woot.Worker do
  @moduledoc """
  Implementation of a GenServer to hold our initial state of max_number and timestamps struct.
  max_number starts as a random number ranging between 0-100 with timestamps starting as nil.
  """
  use GenServer
  alias Woot.State

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

  # Server Callbacks

  @impl true
  def init(_) do
    scheduler() # schedule to run after every 1 minute
    {:ok, %State{}}
  end

  @impl true
  def handle_call(:show, _from, users) do
    {:reply, users, users}
  end


  defp scheduler do
    Process.send_after(self(), :work, 60_000)
  end

end
