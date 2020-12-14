# Woot

This is a tiny api with a single endpoints that fetches a max of 2 users with more points than
max_number which is a genserver state.

# Running the server.

  * Make sure all the dependancies are installed by running `mix deps.get`
  * Run `mix ecto.setup`, this will create the database, run migrations and seed data to the database
  * Start the Server by `mix phx.server` command.

On your browser, visit [`localhost:4000`](http://localhost:4000/api/users)


# Demo

  After starting the server and visiting [`localhost:4000`](http://localhost:4000/api/users), you should see something like this.
  (images/sample.png)

# Running Tests
You can run tests with the `mix test` command