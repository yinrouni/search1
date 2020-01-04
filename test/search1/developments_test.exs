defmodule Search1.DevelopmentsTest do
  use Search1.DataCase

  alias Search1.Developments

  describe "developments" do
    alias Search1.Developments.Development

    @valid_attrs %{is_active: true, year: 42}
    @update_attrs %{is_active: false, year: 43}
    @invalid_attrs %{is_active: nil, year: nil}

    def development_fixture(attrs \\ %{}) do
      {:ok, development} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Developments.create_development()

      development
    end

    test "list_developments/0 returns all developments" do
      development = development_fixture()
      assert Developments.list_developments() == [development]
    end

    test "get_development!/1 returns the development with given id" do
      development = development_fixture()
      assert Developments.get_development!(development.id) == development
    end

    test "create_development/1 with valid data creates a development" do
      assert {:ok, %Development{} = development} = Developments.create_development(@valid_attrs)
      assert development.is_active == true
      assert development.year == 42
    end

    test "create_development/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Developments.create_development(@invalid_attrs)
    end

    test "update_development/2 with valid data updates the development" do
      development = development_fixture()
      assert {:ok, %Development{} = development} = Developments.update_development(development, @update_attrs)
      assert development.is_active == false
      assert development.year == 43
    end

    test "update_development/2 with invalid data returns error changeset" do
      development = development_fixture()
      assert {:error, %Ecto.Changeset{}} = Developments.update_development(development, @invalid_attrs)
      assert development == Developments.get_development!(development.id)
    end

    test "delete_development/1 deletes the development" do
      development = development_fixture()
      assert {:ok, %Development{}} = Developments.delete_development(development)
      assert_raise Ecto.NoResultsError, fn -> Developments.get_development!(development.id) end
    end

    test "change_development/1 returns a development changeset" do
      development = development_fixture()
      assert %Ecto.Changeset{} = Developments.change_development(development)
    end
  end

  describe "conditions" do
    alias Search1.Developments.Condition

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def condition_fixture(attrs \\ %{}) do
      {:ok, condition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Developments.create_condition()

      condition
    end

    test "list_conditions/0 returns all conditions" do
      condition = condition_fixture()
      assert Developments.list_conditions() == [condition]
    end

    test "get_condition!/1 returns the condition with given id" do
      condition = condition_fixture()
      assert Developments.get_condition!(condition.id) == condition
    end

    test "create_condition/1 with valid data creates a condition" do
      assert {:ok, %Condition{} = condition} = Developments.create_condition(@valid_attrs)
      assert condition.name == "some name"
    end

    test "create_condition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Developments.create_condition(@invalid_attrs)
    end

    test "update_condition/2 with valid data updates the condition" do
      condition = condition_fixture()
      assert {:ok, %Condition{} = condition} = Developments.update_condition(condition, @update_attrs)
      assert condition.name == "some updated name"
    end

    test "update_condition/2 with invalid data returns error changeset" do
      condition = condition_fixture()
      assert {:error, %Ecto.Changeset{}} = Developments.update_condition(condition, @invalid_attrs)
      assert condition == Developments.get_condition!(condition.id)
    end

    test "delete_condition/1 deletes the condition" do
      condition = condition_fixture()
      assert {:ok, %Condition{}} = Developments.delete_condition(condition)
      assert_raise Ecto.NoResultsError, fn -> Developments.get_condition!(condition.id) end
    end

    test "change_condition/1 returns a condition changeset" do
      condition = condition_fixture()
      assert %Ecto.Changeset{} = Developments.change_condition(condition)
    end
  end

  describe "phasehighsts" do
    alias Search1.Developments.PhaseHighest

    @valid_attrs %{sort: 42, status: "some status"}
    @update_attrs %{sort: 43, status: "some updated status"}
    @invalid_attrs %{sort: nil, status: nil}

    def phase_highest_fixture(attrs \\ %{}) do
      {:ok, phase_highest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Developments.create_phase_highest()

      phase_highest
    end

    test "list_phasehighsts/0 returns all phasehighsts" do
      phase_highest = phase_highest_fixture()
      assert Developments.list_phasehighsts() == [phase_highest]
    end

    test "get_phase_highest!/1 returns the phase_highest with given id" do
      phase_highest = phase_highest_fixture()
      assert Developments.get_phase_highest!(phase_highest.id) == phase_highest
    end

    test "create_phase_highest/1 with valid data creates a phase_highest" do
      assert {:ok, %PhaseHighest{} = phase_highest} = Developments.create_phase_highest(@valid_attrs)
      assert phase_highest.sort == 42
      assert phase_highest.status == "some status"
    end

    test "create_phase_highest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Developments.create_phase_highest(@invalid_attrs)
    end

    test "update_phase_highest/2 with valid data updates the phase_highest" do
      phase_highest = phase_highest_fixture()
      assert {:ok, %PhaseHighest{} = phase_highest} = Developments.update_phase_highest(phase_highest, @update_attrs)
      assert phase_highest.sort == 43
      assert phase_highest.status == "some updated status"
    end

    test "update_phase_highest/2 with invalid data returns error changeset" do
      phase_highest = phase_highest_fixture()
      assert {:error, %Ecto.Changeset{}} = Developments.update_phase_highest(phase_highest, @invalid_attrs)
      assert phase_highest == Developments.get_phase_highest!(phase_highest.id)
    end

    test "delete_phase_highest/1 deletes the phase_highest" do
      phase_highest = phase_highest_fixture()
      assert {:ok, %PhaseHighest{}} = Developments.delete_phase_highest(phase_highest)
      assert_raise Ecto.NoResultsError, fn -> Developments.get_phase_highest!(phase_highest.id) end
    end

    test "change_phase_highest/1 returns a phase_highest changeset" do
      phase_highest = phase_highest_fixture()
      assert %Ecto.Changeset{} = Developments.change_phase_highest(phase_highest)
    end
  end
end
