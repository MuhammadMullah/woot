defmodule Woot.Factory do
  @moduledoc false
  alias Woot.Repo
  alias Woot.Accounts.User

  # Factories

  def build(:user) do
    %User{
      points: 10
    }
  end


  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
