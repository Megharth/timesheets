defmodule TimesheetsWeb.WorkerController do
  use TimesheetsWeb, :controller

  alias Timesheets.Users
  alias Timesheets.Users.Worker

  def index(conn, _params) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      workers = Users.list_workers()
      render(conn, "index.html", workers: workers)
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def new(conn, _params) do
    changeset = Users.change_worker(%Worker{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"worker" => worker_params}) do
    case Users.create_worker(worker_params) do
      {:ok, worker} ->
        conn
        |> put_flash(:info, "Worker created successfully.")
        |> redirect(to: Routes.worker_path(conn, :show, worker))
    end
  end

  def show(conn, %{"id" => id}) do
    worker = Users.get_worker!(id)
    render(conn, "show.html", worker: worker)
  end

  def delete(conn, %{"id" => id}) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      worker = Users.get_worker!(id)
      {:ok, _worker} = Users.delete_worker(worker)

      conn
      |> put_flash(:info, "Worker deleted successfully.")
      |> redirect(to: Routes.worker_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Invalid operation.")
    end
  end
end
