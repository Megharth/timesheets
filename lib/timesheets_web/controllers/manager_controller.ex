defmodule TimesheetsWeb.ManagerController do
  use TimesheetsWeb, :controller

  alias Timesheets.Users
  alias Timesheets.Users.Manager

  def new(conn, _params) do
    changeset = Users.change_manager(%Manager{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"manager" => manager_params}) do
    case Users.create_manager(manager_params) do
      {:ok, manager} ->
        conn
        |> put_flash(:info, "Manager created successfully.")
        |> redirect(to: Routes.manager_path(conn, :show, manager))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = get_session(conn, :user_type)
    if user === "manager" do
      manager = Users.get_manager_with_workers!(id)
      IO.inspect manager
      render(conn, "show.html", manager: manager)
    else
      conn |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
