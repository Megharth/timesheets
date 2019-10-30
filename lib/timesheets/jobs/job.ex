defmodule Timesheets.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :jobCode, :string
    field :name, :string
    field :budget, :integer
    field :description, :string

    belongs_to :manager, Timesheets.Users.Manager
    timestamps()

  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:jobCode, :name, :budget, :description, :manager_id])
    |> validate_required([:jobCode, :name, :budget, :description, :manager_id])
  end
end
