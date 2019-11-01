defmodule TimesheetsWeb.WorkerController do
  use TimesheetsWeb, :controller

  alias Timesheets.Users
  alias Timesheets.Users.Worker

  def new(conn, _params) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      changeset = Users.change_worker(%Worker{})
      render(conn, "new.html", changeset: changeset)
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def create(conn, %{"worker" => worker_params}) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      userExists = Users.get_user_by_email(worker_params["email"])
      if !userExists do
        worker_params = Map.put(worker_params, "manager_id",
        conn.assigns[:current_user].details.id)
        case Users.create_worker(worker_params) do
          {:ok, _worker} ->
            conn
            |> put_flash(:info, "Worker created successfully.")
            |> redirect(to: Routes.page_path(conn, :index))
        end
      else
        conn
        |> put_flash(:error, "User with the same email already exists")
        |> redirect(to: Routes.worker_path(conn, :new))
      end
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def show(conn, %{"id" => id}) do
    worker = Users.get_worker_with_everything!(id)
    render(conn, "show.html", worker: worker,
      user_type: get_session(conn, :user_type))
  end

  def delete(conn, %{"id" => id}) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      worker = Users.get_worker_with_manager!(id)
      {:ok, _worker} = Users.delete_worker(worker)
      IO.puts "okay"
      conn
      |> put_flash(:info, "Worker deleted successfully.")
      |> redirect(to: Routes.page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Invalid operation.")
    end
  end
end
