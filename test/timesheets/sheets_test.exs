defmodule Timesheets.SheetsTest do
  use Timesheets.DataCase

  alias Timesheets.Sheets

  describe "sheets" do
    alias Timesheets.Sheets.Sheet

    @valid_attrs %{approved: true, hour_0: 120.5, job_0: "some job_0", m: "some m"}
    @update_attrs %{approved: false, hour_0: 456.7, job_0: "some updated job_0", m: "some updated m"}
    @invalid_attrs %{approved: nil, hour_0: nil, job_0: nil, m: nil}

    def sheet_fixture(attrs \\ %{}) do
      {:ok, sheet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sheets.create_sheet()

      sheet
    end

    test "list_sheets/0 returns all sheets" do
      sheet = sheet_fixture()
      assert Sheets.list_sheets() == [sheet]
    end

    test "get_sheet!/1 returns the sheet with given id" do
      sheet = sheet_fixture()
      assert Sheets.get_sheet!(sheet.id) == sheet
    end

    test "create_sheet/1 with valid data creates a sheet" do
      assert {:ok, %Sheet{} = sheet} = Sheets.create_sheet(@valid_attrs)
      assert sheet.approved == true
      assert sheet.hour_0 == 120.5
      assert sheet.job_0 == "some job_0"
      assert sheet.m == "some m"
    end

    test "create_sheet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sheets.create_sheet(@invalid_attrs)
    end

    test "update_sheet/2 with valid data updates the sheet" do
      sheet = sheet_fixture()
      assert {:ok, %Sheet{} = sheet} = Sheets.update_sheet(sheet, @update_attrs)
      assert sheet.approved == false
      assert sheet.hour_0 == 456.7
      assert sheet.job_0 == "some updated job_0"
      assert sheet.m == "some updated m"
    end

    test "update_sheet/2 with invalid data returns error changeset" do
      sheet = sheet_fixture()
      assert {:error, %Ecto.Changeset{}} = Sheets.update_sheet(sheet, @invalid_attrs)
      assert sheet == Sheets.get_sheet!(sheet.id)
    end

    test "delete_sheet/1 deletes the sheet" do
      sheet = sheet_fixture()
      assert {:ok, %Sheet{}} = Sheets.delete_sheet(sheet)
      assert_raise Ecto.NoResultsError, fn -> Sheets.get_sheet!(sheet.id) end
    end

    test "change_sheet/1 returns a sheet changeset" do
      sheet = sheet_fixture()
      assert %Ecto.Changeset{} = Sheets.change_sheet(sheet)
    end
  end
end
