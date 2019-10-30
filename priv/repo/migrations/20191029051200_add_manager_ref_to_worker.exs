defmodule Timesheets.Repo.Migrations.AddManagerRefToWorker do
  use Ecto.Migration

  def change do
    alter table("workers") do
      add :manager_id, references(:managers)
    end
  end
end
