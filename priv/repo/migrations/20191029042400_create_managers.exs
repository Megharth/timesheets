defmodule Timesheets.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :email, :string
      add :name, :string
      add :password_hash, :string
      add :password, :string
      add :password_confirmation, :string

      timestamps()
    end

  end
end
