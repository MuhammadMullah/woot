# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Woot.Repo.insert!(%Woot.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
1..100 |> Enum.each(fn _ -> Woot.Accounts.create_user(%{points: Enum.random(0..100)}) end)
