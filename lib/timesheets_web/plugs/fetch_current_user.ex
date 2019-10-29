defmodule TimesheetsWeb.Plugs.FetchCurrentUser do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    user = Timesheets.Users.get_user(get_session(conn, :user_id) || -1, get_session(conn, :user_type) || -1)
    # IO.inspect get_session(conn, :user_type)
    if user do
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end
end
