defmodule Timesheets.Users.Worker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workers" do
    field :password_hash, :string
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :pay, :string

    belongs_to :manager, Timesheets.Users.Manager
    has_many :sheets, Timesheets.Sheets.Sheet
    timestamps()

  end

  @doc false
  def changeset(worker, attrs) do
    worker
    |> cast(attrs, [:email, :name, :password, :password_confirmation,
      :manager_id, :pay])
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 8)
    |> hash_password()
    |> validate_required([:email, :name, :password_hash, :manager_id, :pay])
  end

  def hash_password(cset) do
    pw = get_change(cset, :password)
    if pw do
      change(cset, Argon2.add_hash(pw))
    else
      cset
    end
  end
end
