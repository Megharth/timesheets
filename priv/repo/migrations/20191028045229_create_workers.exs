defmodule Timesheets.Repo.Migrations.CreateWorkers do
  use Ecto.Migration

  def change do
    create table(:workers) do
      add :email, :string
      add :name, :string

      timestamps()
    end

  end
end
