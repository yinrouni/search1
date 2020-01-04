defmodule Search1.AdministrationsTest do
  use Search1.DataCase

  alias Search1.Administrations

  describe "administrations" do
    alias Search1.Administrations.Administration

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def administration_fixture(attrs \\ %{}) do
      {:ok, administration} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administrations.create_administration()

      administration
    end

    test "list_administrations/0 returns all administrations" do
      administration = administration_fixture()
      assert Administrations.list_administrations() == [administration]
    end

    test "get_administration!/1 returns the administration with given id" do
      administration = administration_fixture()
      assert Administrations.get_administration!(administration.id) == administration
    end

    test "create_administration/1 with valid data creates a administration" do
      assert {:ok, %Administration{} = administration} = Administrations.create_administration(@valid_attrs)
      assert administration.name == "some name"
    end

    test "create_administration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administrations.create_administration(@invalid_attrs)
    end

    test "update_administration/2 with valid data updates the administration" do
      administration = administration_fixture()
      assert {:ok, %Administration{} = administration} = Administrations.update_administration(administration, @update_attrs)
      assert administration.name == "some updated name"
    end

    test "update_administration/2 with invalid data returns error changeset" do
      administration = administration_fixture()
      assert {:error, %Ecto.Changeset{}} = Administrations.update_administration(administration, @invalid_attrs)
      assert administration == Administrations.get_administration!(administration.id)
    end

    test "delete_administration/1 deletes the administration" do
      administration = administration_fixture()
      assert {:ok, %Administration{}} = Administrations.delete_administration(administration)
      assert_raise Ecto.NoResultsError, fn -> Administrations.get_administration!(administration.id) end
    end

    test "change_administration/1 returns a administration changeset" do
      administration = administration_fixture()
      assert %Ecto.Changeset{} = Administrations.change_administration(administration)
    end
  end

  describe "dev_ads" do
    alias Search1.Administrations.DevAd

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dev_ad_fixture(attrs \\ %{}) do
      {:ok, dev_ad} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administrations.create_dev_ad()

      dev_ad
    end

    test "list_dev_ads/0 returns all dev_ads" do
      dev_ad = dev_ad_fixture()
      assert Administrations.list_dev_ads() == [dev_ad]
    end

    test "get_dev_ad!/1 returns the dev_ad with given id" do
      dev_ad = dev_ad_fixture()
      assert Administrations.get_dev_ad!(dev_ad.id) == dev_ad
    end

    test "create_dev_ad/1 with valid data creates a dev_ad" do
      assert {:ok, %DevAd{} = dev_ad} = Administrations.create_dev_ad(@valid_attrs)
    end

    test "create_dev_ad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administrations.create_dev_ad(@invalid_attrs)
    end

    test "update_dev_ad/2 with valid data updates the dev_ad" do
      dev_ad = dev_ad_fixture()
      assert {:ok, %DevAd{} = dev_ad} = Administrations.update_dev_ad(dev_ad, @update_attrs)
    end

    test "update_dev_ad/2 with invalid data returns error changeset" do
      dev_ad = dev_ad_fixture()
      assert {:error, %Ecto.Changeset{}} = Administrations.update_dev_ad(dev_ad, @invalid_attrs)
      assert dev_ad == Administrations.get_dev_ad!(dev_ad.id)
    end

    test "delete_dev_ad/1 deletes the dev_ad" do
      dev_ad = dev_ad_fixture()
      assert {:ok, %DevAd{}} = Administrations.delete_dev_ad(dev_ad)
      assert_raise Ecto.NoResultsError, fn -> Administrations.get_dev_ad!(dev_ad.id) end
    end

    test "change_dev_ad/1 returns a dev_ad changeset" do
      dev_ad = dev_ad_fixture()
      assert %Ecto.Changeset{} = Administrations.change_dev_ad(dev_ad)
    end
  end
end
