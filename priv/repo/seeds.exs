# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheets.Repo.insert!(%Timesheets.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Timesheets.Repo
alias Timesheets.Users.Manager

pw = Argon2.hash_pwd_salt("helloworld")

Repo.insert!(%Manager{name: "Alice", email: "alice@example.com", password_hash: pw})
Repo.insert!(%Manager{name: "Bob", email: "bob@example.com", password_hash: pw})
