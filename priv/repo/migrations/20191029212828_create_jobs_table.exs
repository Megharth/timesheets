defmodule Timesheets.Repo.Migrations.CreateJobsTable do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :jobCode, :string
      add :name, :string
      add :manager_id, references(:managers)
      add :budget, :int
      add :description, :text

      timestamps()
    end
  end
end
