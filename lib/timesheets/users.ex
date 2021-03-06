defmodule Timesheets.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Timesheets.Repo

  alias Timesheets.Users.Worker

  @doc """
  Returns the list of workers.

  ## Examples

      iex> list_workers()
      [%Worker{}, ...]

  """
  def list_workers do
    Repo.all(Worker)
  end

  @doc """
  Gets a single worker.

  Raises `Ecto.NoResultsError` if the Worker does not exist.

  ## Examples

      iex> get_worker!(123)
      %Worker{}

      iex> get_worker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_worker!(id) do
    Repo.one! from w in Worker,
      where: w.id == ^id
  end

  def get_worker_with_manager!(id) do
    Repo.one! from w in Worker,
      where: w.id == ^id,
      preload: [:manager]
  end

  def get_worker_with_everything!(id) do
    Repo.one! from w in Worker,
    where: w.id == ^id,
    preload: [:sheets, :manager]
  end

  @doc """
  Creates a worker.

  ## Examples

      iex> create_worker(%{field: value})
      {:ok, %Worker{}}

      iex> create_worker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_worker(attrs \\ %{}) do
    %Worker{}
    |> Worker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a Worker.

  ## Examples

      iex> delete_worker(worker)
      {:ok, %Worker{}}

      iex> delete_worker(worker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_worker(%Worker{} = worker) do
    Repo.delete(worker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking worker changes.

  ## Examples

      iex> change_worker(worker)
      %Ecto.Changeset{source: %Worker{}}

  """
  def change_worker(%Worker{} = worker) do
    Worker.changeset(worker, %{})
  end

  @doc """
  Updates a worker.
  ## Examples
      iex> update_worker(worker, %{field: new_value})
      {:ok, %Worker{}}
      iex> update_worker(worker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_worker(%Worker{} = worker, attrs) do
    worker
    |> Worker.changeset(attrs)
    |> Repo.update()
  end


  alias Timesheets.Users.Manager

  @doc """
  Returns the list of managers.

  ## Examples

      iex> list_managers()
      [%Manager{}, ...]

  """
  def list_managers do
    Repo.all(Manager)
  end

  @doc """
  Gets a single manager.

  Raises `Ecto.NoResultsError` if the Manager does not exist.

  ## Examples

      iex> get_manager!(123)
      %Manager{}

      iex> get_manager!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manager!(id), do: Repo.get!(Manager, id)

  def get_manager_with_workers!(id) do
    Repo.one from m in Manager,
      where: m.id == ^id,
      preload: [:workers]
  end

  @doc """
  Creates a manager.

  ## Examples

      iex> create_manager(%{field: value})
      {:ok, %Manager{}}

      iex> create_manager(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manager(attrs \\ %{}) do
    %Manager{}
    |> Manager.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a Manager.

  ## Examples

      iex> delete_manager(manager)
      {:ok, %Manager{}}

      iex> delete_manager(manager)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manager(%Manager{} = manager) do
    Repo.delete(manager)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manager changes.

  ## Examples

      iex> change_manager(manager)
      %Ecto.Changeset{source: %Manager{}}

  """
  def change_manager(%Manager{} = manager) do
    Manager.changeset(manager, %{})
  end

  def get_user(id, user_type) do
    if user_type === "worker" do
      Repo.get(Worker, id)
    else
      Repo.get(Manager, id)
    end
  end

  def get_user_by_email(email) do
    workers = Repo.all from w in Worker,
                where: w.email == ^email
    managers = Repo.all from m in Manager,
                where: m.email == ^email
    if length(workers) > 0 or length(managers) > 0 do
      true
    else
      false
    end
  end

  def authenticate(email, pass, user_type) do
    if user_type === "worker" do
      user = Repo.get_by(Worker, email: email)
      case Argon2.check_pass(user, pass) do
        {:ok, user} -> user
        _ -> nil
      end
    else
      user = Repo.get_by(Manager, email: email)
      case Argon2.check_pass(user, pass) do
        {:ok, user} -> user
        _ -> nil
      end
    end
  end
end
