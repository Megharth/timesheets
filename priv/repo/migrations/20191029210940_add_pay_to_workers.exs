defmodule Timesheets.Repo.Migrations.AddPayToWorkers do
  use Ecto.Migration

  def change do
    alter table("workers") do
      add :pay, :string, null: false
    end
  end
end
