defmodule TimesheetsWeb.SheetController do
  use TimesheetsWeb, :controller

  alias Timesheets.Sheets
  alias Timesheets.Sheets.Sheet
  alias Timesheets.Jobs

  def new(conn, _params) do
    user_type = get_session(conn, :user_type)
    if user_type == "worker" do
      jobs = Jobs.list_jobs()
      changeset = Sheets.change_sheet(%Sheet{})
      render(conn, "new.html", changeset: changeset, jobs: jobs)
    else
      conn
      |> put_flash(:error, "Invalid operation")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def to_float(str) do
    {f, _} = Float.parse(str  )
    f
  end

  def create(conn, %{"sheet" => sheet_params}) do
    user_type = get_session(conn, :user_type)
    jobs = Jobs.list_jobs()
    changeset = Sheets.change_sheet(%Sheet{})
    if user_type == "worker" do
      sheet_params = if sheet_params["job_0"] === "None" do
        Map.put(sheet_params, "hour_0", "0") else sheet_params end
      sheet_params = if sheet_params["job_1"] === "None" do
        Map.put(sheet_params, "hour_1", "0") else sheet_params end
      sheet_params = if sheet_params["job_2"] === "None" do
        Map.put(sheet_params, "hour_2", "0") else sheet_params end
      sheet_params = if sheet_params["job_3"] === "None" do
        Map.put(sheet_params, "hour_3", "0") else sheet_params end
      sheet_params = if sheet_params["job_4"] === "None" do
        Map.put(sheet_params, "hour_4", "0") else sheet_params end
      sheet_params = if sheet_params["job_5"] === "None" do
        Map.put(sheet_params, "hour_5", "0") else sheet_params end
      sheet_params = if sheet_params["job_6"] === "None" do
        Map.put(sheet_params, "hour_6", "0") else sheet_params end
      sheet_params = if sheet_params["job_7"] === "None" do
        Map.put(sheet_params, "hour_7", "0") else sheet_params end

      hours = to_float(sheet_params["hour_0"]) +
        to_float(sheet_params["hour_1"]) + to_float(sheet_params["hour_2"]) +
        to_float(sheet_params["hour_3"]) + to_float(sheet_params["hour_4"]) +
        to_float(sheet_params["hour_5"]) + to_float(sheet_params["hour_6"]) +
        to_float(sheet_params["hour_7"])

      if hours == 0 or hours > 8 do
        conn
        |> put_flash(:error, "Hours cannot be 0 or more than 8. Hours dedicated
            to job code \"None\" is not counted.")
        |> render("new.html", changeset: changeset, jobs: jobs)
      else
        records = Sheets.get_by_date(sheet_params["date"],
          conn.assigns[:current_user].details.id)
        if length(records) >= 1 do
          conn
          |> put_flash(:error, "A timesheet already exists for the given date.")
          |> render("new.html", changeset: changeset, jobs: jobs)
        else
          sheet_params = Map.put(sheet_params, "worker_id",
            conn.assigns[:current_user].details.id)
          case Sheets.create_sheet(sheet_params) do
            {:ok, sheet} ->
              conn
              |> put_flash(:info, "Sheet created successfully.")
              |> redirect(to: Routes.sheet_path(conn, :show, sheet))

            {:error, %Ecto.Changeset{} = changeset} ->
              render(conn, "new.html", changeset: changeset, jobs: jobs)
          end
        end
      end
    else
      conn
      |> put_flash(:error, "Invalid operation")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def show(conn, %{"id" => id}) do
    user_type = get_session(conn, :user_type)
    jobs = Jobs.list_jobs()
    sheet = Sheets.get_sheet!(id)
    changeset = Sheets.change_sheet(sheet)
    render(conn, "show.html", sheet: sheet, changeset: changeset, jobs: jobs,
      user_type: user_type)
  end
  def update(conn, %{"id" => id, "sheet" => sheet_params}) do
    sheet = Sheets.get_sheet!(id)

    case Sheets.update_sheet(sheet, sheet_params) do
      {:ok, sheet} ->
        conn
        |> put_flash(:info, "Sheet updated successfully.")
        |> redirect(to: Routes.sheet_path(conn, :show, sheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sheet: sheet, changeset: changeset)
    end
  end
end
