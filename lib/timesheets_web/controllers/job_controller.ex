defmodule TimesheetsWeb.JobController do
  use TimesheetsWeb, :controller

  alias Timesheets.Jobs
  alias Timesheets.Jobs.Job

  def index(conn, _params) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      jobs = Jobs.list_jobs()
      IO.inspect jobs
      render(conn, "index.html", jobs: jobs)
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def new(conn, _params) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      changeset = Jobs.change_job(%Job{})
      render(conn, "new.html", changeset: changeset)
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def create(conn, %{"job" => job_params}) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      job_params = Map.put(job_params, "manager_id", conn.assigns[:current_user].details.id)
      IO.inspect job_params
      case Jobs.create_job(job_params) do
        {:ok, _job} ->
          conn
          |> put_flash(:info, "Job created successfully.")
          |> redirect(to: Routes.job_path(conn, :index))
      end
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
