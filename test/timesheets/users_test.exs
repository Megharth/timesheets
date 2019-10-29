defmodule Timesheets.UsersTest do
  use Timesheets.DataCase

  alias Timesheets.Users

  describe "workers" do
    alias Timesheets.Users.Worker

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def worker_fixture(attrs \\ %{}) do
      {:ok, worker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_worker()

      worker
    end

    test "list_workers/0 returns all workers" do
      worker = worker_fixture()
      assert Users.list_workers() == [worker]
    end

    test "get_worker!/1 returns the worker with given id" do
      worker = worker_fixture()
      assert Users.get_worker!(worker.id) == worker
    end

    test "create_worker/1 with valid data creates a worker" do
      assert {:ok, %Worker{} = worker} = Users.create_worker(@valid_attrs)
      assert worker.email == "some email"
      assert worker.name == "some name"
    end

    test "create_worker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_worker(@invalid_attrs)
    end

    test "update_worker/2 with valid data updates the worker" do
      worker = worker_fixture()
      assert {:ok, %Worker{} = worker} = Users.update_worker(worker, @update_attrs)
      assert worker.email == "some updated email"
      assert worker.name == "some updated name"
    end

    test "update_worker/2 with invalid data returns error changeset" do
      worker = worker_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_worker(worker, @invalid_attrs)
      assert worker == Users.get_worker!(worker.id)
    end

    test "delete_worker/1 deletes the worker" do
      worker = worker_fixture()
      assert {:ok, %Worker{}} = Users.delete_worker(worker)
      assert_raise Ecto.NoResultsError, fn -> Users.get_worker!(worker.id) end
    end

    test "change_worker/1 returns a worker changeset" do
      worker = worker_fixture()
      assert %Ecto.Changeset{} = Users.change_worker(worker)
    end
  end

  describe "managers" do
    alias Timesheets.Users.Manager

    @valid_attrs %{email: "some email", name: "some name", password: "some password", password_confirmation: "some password_confirmation", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password", password_confirmation: "some updated password_confirmation", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, name: nil, password: nil, password_confirmation: nil, password_hash: nil}

    def manager_fixture(attrs \\ %{}) do
      {:ok, manager} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_manager()

      manager
    end

    test "list_managers/0 returns all managers" do
      manager = manager_fixture()
      assert Users.list_managers() == [manager]
    end

    test "get_manager!/1 returns the manager with given id" do
      manager = manager_fixture()
      assert Users.get_manager!(manager.id) == manager
    end

    test "create_manager/1 with valid data creates a manager" do
      assert {:ok, %Manager{} = manager} = Users.create_manager(@valid_attrs)
      assert manager.email == "some email"
      assert manager.name == "some name"
      assert manager.password == "some password"
      assert manager.password_confirmation == "some password_confirmation"
      assert manager.password_hash == "some password_hash"
    end

    test "create_manager/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_manager(@invalid_attrs)
    end

    test "update_manager/2 with valid data updates the manager" do
      manager = manager_fixture()
      assert {:ok, %Manager{} = manager} = Users.update_manager(manager, @update_attrs)
      assert manager.email == "some updated email"
      assert manager.name == "some updated name"
      assert manager.password == "some updated password"
      assert manager.password_confirmation == "some updated password_confirmation"
      assert manager.password_hash == "some updated password_hash"
    end

    test "update_manager/2 with invalid data returns error changeset" do
      manager = manager_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_manager(manager, @invalid_attrs)
      assert manager == Users.get_manager!(manager.id)
    end

    test "delete_manager/1 deletes the manager" do
      manager = manager_fixture()
      assert {:ok, %Manager{}} = Users.delete_manager(manager)
      assert_raise Ecto.NoResultsError, fn -> Users.get_manager!(manager.id) end
    end

    test "change_manager/1 returns a manager changeset" do
      manager = manager_fixture()
      assert %Ecto.Changeset{} = Users.change_manager(manager)
    end
  end
end
