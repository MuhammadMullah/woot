defmodule Woot.State do
  @moduledoc false
  defstruct max_number: Enum.random(0..100), users: [], timestamp: nil
end
