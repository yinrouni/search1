defmodule Search1.DrugsTest do
  use Search1.DataCase

  alias Search1.Drugs

  describe "drugs" do
    alias Search1.Drugs.Drug

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def drug_fixture(attrs \\ %{}) do
      {:ok, drug} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drugs.create_drug()

      drug
    end

    test "list_drugs/0 returns all drugs" do
      drug = drug_fixture()
      assert Drugs.list_drugs() == [drug]
    end

    test "get_drug!/1 returns the drug with given id" do
      drug = drug_fixture()
      assert Drugs.get_drug!(drug.id) == drug
    end

    test "create_drug/1 with valid data creates a drug" do
      assert {:ok, %Drug{} = drug} = Drugs.create_drug(@valid_attrs)
    end

    test "create_drug/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drugs.create_drug(@invalid_attrs)
    end

    test "update_drug/2 with valid data updates the drug" do
      drug = drug_fixture()
      assert {:ok, %Drug{} = drug} = Drugs.update_drug(drug, @update_attrs)
    end

    test "update_drug/2 with invalid data returns error changeset" do
      drug = drug_fixture()
      assert {:error, %Ecto.Changeset{}} = Drugs.update_drug(drug, @invalid_attrs)
      assert drug == Drugs.get_drug!(drug.id)
    end

    test "delete_drug/1 deletes the drug" do
      drug = drug_fixture()
      assert {:ok, %Drug{}} = Drugs.delete_drug(drug)
      assert_raise Ecto.NoResultsError, fn -> Drugs.get_drug!(drug.id) end
    end

    test "change_drug/1 returns a drug changeset" do
      drug = drug_fixture()
      assert %Ecto.Changeset{} = Drugs.change_drug(drug)
    end
  end

  describe "mechanism_drug" do
    alias Search1.Drugs.MechanismDrug

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def mechanism_drug_fixture(attrs \\ %{}) do
      {:ok, mechanism_drug} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drugs.create_mechanism_drug()

      mechanism_drug
    end

    test "list_mechanism_drug/0 returns all mechanism_drug" do
      mechanism_drug = mechanism_drug_fixture()
      assert Drugs.list_mechanism_drug() == [mechanism_drug]
    end

    test "get_mechanism_drug!/1 returns the mechanism_drug with given id" do
      mechanism_drug = mechanism_drug_fixture()
      assert Drugs.get_mechanism_drug!(mechanism_drug.id) == mechanism_drug
    end

    test "create_mechanism_drug/1 with valid data creates a mechanism_drug" do
      assert {:ok, %MechanismDrug{} = mechanism_drug} = Drugs.create_mechanism_drug(@valid_attrs)
    end

    test "create_mechanism_drug/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drugs.create_mechanism_drug(@invalid_attrs)
    end

    test "update_mechanism_drug/2 with valid data updates the mechanism_drug" do
      mechanism_drug = mechanism_drug_fixture()
      assert {:ok, %MechanismDrug{} = mechanism_drug} = Drugs.update_mechanism_drug(mechanism_drug, @update_attrs)
    end

    test "update_mechanism_drug/2 with invalid data returns error changeset" do
      mechanism_drug = mechanism_drug_fixture()
      assert {:error, %Ecto.Changeset{}} = Drugs.update_mechanism_drug(mechanism_drug, @invalid_attrs)
      assert mechanism_drug == Drugs.get_mechanism_drug!(mechanism_drug.id)
    end

    test "delete_mechanism_drug/1 deletes the mechanism_drug" do
      mechanism_drug = mechanism_drug_fixture()
      assert {:ok, %MechanismDrug{}} = Drugs.delete_mechanism_drug(mechanism_drug)
      assert_raise Ecto.NoResultsError, fn -> Drugs.get_mechanism_drug!(mechanism_drug.id) end
    end

    test "change_mechanism_drug/1 returns a mechanism_drug changeset" do
      mechanism_drug = mechanism_drug_fixture()
      assert %Ecto.Changeset{} = Drugs.change_mechanism_drug(mechanism_drug)
    end
  end
end
