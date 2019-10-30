defmodule TimesheetsWeb.PageController do
  use TimesheetsWeb, :controller

  def index(conn, _params) do
    user = conn.assigns[:current_user]
    if user do
      user_type = get_session(conn, :user_type)
      if user_type === "worker" do
        conn |> redirect(to: Routes.worker_path(conn, :show, user.details))
      else
        conn |> redirect(to: Routes.manager_path(conn, :show, user.details))
      end
    else
      conn |> redirect(to: Routes.session_path(conn, :new))
    end
  end
end
