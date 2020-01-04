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

  describe "namecodes" do
    alias Search1.Drugs.NameCode

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def name_code_fixture(attrs \\ %{}) do
      {:ok, name_code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drugs.create_name_code()

      name_code
    end

    test "list_namecodes/0 returns all namecodes" do
      name_code = name_code_fixture()
      assert Drugs.list_namecodes() == [name_code]
    end

    test "get_name_code!/1 returns the name_code with given id" do
      name_code = name_code_fixture()
      assert Drugs.get_name_code!(name_code.id) == name_code
    end

    test "create_name_code/1 with valid data creates a name_code" do
      assert {:ok, %NameCode{} = name_code} = Drugs.create_name_code(@valid_attrs)
      assert name_code.name == "some name"
    end

    test "create_name_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drugs.create_name_code(@invalid_attrs)
    end

    test "update_name_code/2 with valid data updates the name_code" do
      name_code = name_code_fixture()
      assert {:ok, %NameCode{} = name_code} = Drugs.update_name_code(name_code, @update_attrs)
      assert name_code.name == "some updated name"
    end

    test "update_name_code/2 with invalid data returns error changeset" do
      name_code = name_code_fixture()
      assert {:error, %Ecto.Changeset{}} = Drugs.update_name_code(name_code, @invalid_attrs)
      assert name_code == Drugs.get_name_code!(name_code.id)
    end

    test "delete_name_code/1 deletes the name_code" do
      name_code = name_code_fixture()
      assert {:ok, %NameCode{}} = Drugs.delete_name_code(name_code)
      assert_raise Ecto.NoResultsError, fn -> Drugs.get_name_code!(name_code.id) end
    end

    test "change_name_code/1 returns a name_code changeset" do
      name_code = name_code_fixture()
      assert %Ecto.Changeset{} = Drugs.change_name_code(name_code)
    end
  end

  describe "namebrands" do
    alias Search1.Drugs.NameBrand

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def name_brand_fixture(attrs \\ %{}) do
      {:ok, name_brand} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drugs.create_name_brand()

      name_brand
    end

    test "list_namebrands/0 returns all namebrands" do
      name_brand = name_brand_fixture()
      assert Drugs.list_namebrands() == [name_brand]
    end

    test "get_name_brand!/1 returns the name_brand with given id" do
      name_brand = name_brand_fixture()
      assert Drugs.get_name_brand!(name_brand.id) == name_brand
    end

    test "create_name_brand/1 with valid data creates a name_brand" do
      assert {:ok, %NameBrand{} = name_brand} = Drugs.create_name_brand(@valid_attrs)
      assert name_brand.name == "some name"
    end

    test "create_name_brand/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drugs.create_name_brand(@invalid_attrs)
    end

    test "update_name_brand/2 with valid data updates the name_brand" do
      name_brand = name_brand_fixture()
      assert {:ok, %NameBrand{} = name_brand} = Drugs.update_name_brand(name_brand, @update_attrs)
      assert name_brand.name == "some updated name"
    end

    test "update_name_brand/2 with invalid data returns error changeset" do
      name_brand = name_brand_fixture()
      assert {:error, %Ecto.Changeset{}} = Drugs.update_name_brand(name_brand, @invalid_attrs)
      assert name_brand == Drugs.get_name_brand!(name_brand.id)
    end

    test "delete_name_brand/1 deletes the name_brand" do
      name_brand = name_brand_fixture()
      assert {:ok, %NameBrand{}} = Drugs.delete_name_brand(name_brand)
      assert_raise Ecto.NoResultsError, fn -> Drugs.get_name_brand!(name_brand.id) end
    end

    test "change_name_brand/1 returns a name_brand changeset" do
      name_brand = name_brand_fixture()
      assert %Ecto.Changeset{} = Drugs.change_name_brand(name_brand)
    end
  end

  describe "namegenerics" do
    alias Search1.Drugs.NameGeneric

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def name_generic_fixture(attrs \\ %{}) do
      {:ok, name_generic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drugs.create_name_generic()

      name_generic
    end

    test "list_namegenerics/0 returns all namegenerics" do
      name_generic = name_generic_fixture()
      assert Drugs.list_namegenerics() == [name_generic]
    end

    test "get_name_generic!/1 returns the name_generic with given id" do
      name_generic = name_generic_fixture()
      assert Drugs.get_name_generic!(name_generic.id) == name_generic
    end

    test "create_name_generic/1 with valid data creates a name_generic" do
      assert {:ok, %NameGeneric{} = name_generic} = Drugs.create_name_generic(@valid_attrs)
      assert name_generic.name == "some name"
    end

    test "create_name_generic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drugs.create_name_generic(@invalid_attrs)
    end

    test "update_name_generic/2 with valid data updates the name_generic" do
      name_generic = name_generic_fixture()
      assert {:ok, %NameGeneric{} = name_generic} = Drugs.update_name_generic(name_generic, @update_attrs)
      assert name_generic.name == "some updated name"
    end

    test "update_name_generic/2 with invalid data returns error changeset" do
      name_generic = name_generic_fixture()
      assert {:error, %Ecto.Changeset{}} = Drugs.update_name_generic(name_generic, @invalid_attrs)
      assert name_generic == Drugs.get_name_generic!(name_generic.id)
    end

    test "delete_name_generic/1 deletes the name_generic" do
      name_generic = name_generic_fixture()
      assert {:ok, %NameGeneric{}} = Drugs.delete_name_generic(name_generic)
      assert_raise Ecto.NoResultsError, fn -> Drugs.get_name_generic!(name_generic.id) end
    end

    test "change_name_generic/1 returns a name_generic changeset" do
      name_generic = name_generic_fixture()
      assert %Ecto.Changeset{} = Drugs.change_name_generic(name_generic)
    end
  end
end
