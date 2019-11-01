defmodule Timesheets.Sheets.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :approved, :boolean, default: false
    field :hour_0, :float
    field :job_0, :string
    field :job_1, :string
    field :hour_1, :float
    field :job_2, :string
    field :hour_2, :float
    field :job_3, :string
    field :hour_3, :float
    field :job_4, :string
    field :hour_4, :float
    field :job_5, :string
    field :hour_5, :float
    field :job_6, :string
    field :hour_6, :float
    field :job_7, :string
    field :hour_7, :float
    field :date, :date

    belongs_to :worker, Timesheets.Users.Worker

    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:approved, :job_0, :hour_0, :job_1, :hour_1, :job_2,
      :hour_2, :job_3, :hour_3, :job_4, :hour_4, :job_5, :hour_5, :job_6,
      :hour_6, :job_7, :hour_7, :worker_id, :date])
    |> validate_required([:approved, :job_0, :hour_0, :job_1, :hour_1, :job_2,
      :hour_2, :job_3, :hour_3, :job_4, :hour_4, :job_5, :hour_5, :job_6,
      :hour_6, :job_7, :hour_7, :worker_id, :date])
  end
end
