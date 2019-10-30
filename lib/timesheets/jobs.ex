defmodule Timesheets.Jobs do
  @moduledoc """
  The Jobs context.
  """

  import Ecto.Query, warn: false
  alias Timesheets.Repo

  alias Timesheets.Jobs.Job

  @doc """
  Returns the list of jobs.

  ## Examples

      iex> list_jobs()
      [%Job{}, ...]

  """
  def list_jobs do
    Repo.all(Job)
    |> Repo.preload([:manager])
  end

  @doc """
  Gets a single Job.

  Raises `Ecto.NoResultsError` if the Job does not exist.

  ## Examples

      iex> get_Job!(123)
      %Job{}

      iex> get_job!(456)
      ** (Ecto.NoResultsError)

  """
  def get_job!(id) do
    Repo.one! from w in Job,
      where: w.id == ^id
  end

  def get_job_with_manager!(id) do
    Repo.one! from w in Job,
      where: w.id == ^id,
      preload: [:manager]
  end

  @doc """
  Creates a job.

  ## Examples

      iex> create_job(%{field: value})
      {:ok, %job{}}

      iex> create_job(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_job(attrs \\ %{}) do
    %Job{}
    |> Job.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a job.

  ## Examples

      iex> delete_job(job)
      {:ok, %job{}}

      iex> delete_job(job)
      {:error, %Ecto.Changeset{}}

  """
  def delete_job(%Job{} = job) do
    Repo.delete(job)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking job changes.

  ## Examples

      iex> change_job(job)
      %Ecto.Changeset{source: %job{}}

  """
  def change_job(%Job{} = job) do
    Job.changeset(job, %{})
  end

end
