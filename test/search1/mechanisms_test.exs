defmodule Search1.MechanismsTest do
  use Search1.DataCase

  alias Search1.Mechanisms

  describe "mechanisms" do
    alias Search1.Mechanisms.Mechanism

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def mechanism_fixture(attrs \\ %{}) do
      {:ok, mechanism} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mechanisms.create_mechanism()

      mechanism
    end

    test "list_mechanisms/0 returns all mechanisms" do
      mechanism = mechanism_fixture()
      assert Mechanisms.list_mechanisms() == [mechanism]
    end

    test "get_mechanism!/1 returns the mechanism with given id" do
      mechanism = mechanism_fixture()
      assert Mechanisms.get_mechanism!(mechanism.id) == mechanism
    end

    test "create_mechanism/1 with valid data creates a mechanism" do
      assert {:ok, %Mechanism{} = mechanism} = Mechanisms.create_mechanism(@valid_attrs)
    end

    test "create_mechanism/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mechanisms.create_mechanism(@invalid_attrs)
    end

    test "update_mechanism/2 with valid data updates the mechanism" do
      mechanism = mechanism_fixture()
      assert {:ok, %Mechanism{} = mechanism} = Mechanisms.update_mechanism(mechanism, @update_attrs)
    end

    test "update_mechanism/2 with invalid data returns error changeset" do
      mechanism = mechanism_fixture()
      assert {:error, %Ecto.Changeset{}} = Mechanisms.update_mechanism(mechanism, @invalid_attrs)
      assert mechanism == Mechanisms.get_mechanism!(mechanism.id)
    end

    test "delete_mechanism/1 deletes the mechanism" do
      mechanism = mechanism_fixture()
      assert {:ok, %Mechanism{}} = Mechanisms.delete_mechanism(mechanism)
      assert_raise Ecto.NoResultsError, fn -> Mechanisms.get_mechanism!(mechanism.id) end
    end

    test "change_mechanism/1 returns a mechanism changeset" do
      mechanism = mechanism_fixture()
      assert %Ecto.Changeset{} = Mechanisms.change_mechanism(mechanism)
    end
  end
end
