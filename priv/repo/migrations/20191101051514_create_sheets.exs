defmodule Timesheets.Repo.Migrations.CreateSheets do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :approved, :boolean, default: false, null: false
      add :job_0, :string
      add :hour_0, :float
      add :job_1, :string
      add :hour_1, :float
      add :job_2, :string
      add :hour_2, :float
      add :job_3, :string
      add :hour_3, :float
      add :job_4, :string
      add :hour_4, :float
      add :job_5, :string
      add :hour_5, :float
      add :job_6, :string
      add :hour_6, :float
      add :job_7, :string
      add :hour_7, :float
      add :worker_id, references(:workers, on_delete: :nothing)
      add :date, :date
      timestamps()
    end

    create index(:sheets, [:worker_id])
  end
end
