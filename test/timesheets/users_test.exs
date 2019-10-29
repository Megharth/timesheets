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
end
