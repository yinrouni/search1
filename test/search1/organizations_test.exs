defmodule Search1.OrganizationsTest do
  use Search1.DataCase

  alias Search1.Organizations

  describe "organizations" do
    alias Search1.Organizations.Organization

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def organization_fixture(attrs \\ %{}) do
      {:ok, organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_organization()

      organization
    end

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture()
      assert Organizations.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Organizations.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = organization} = Organizations.create_organization(@valid_attrs)
      assert organization.name == "some name"
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{} = organization} = Organizations.update_organization(organization, @update_attrs)
      assert organization.name == "some updated name"
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_organization(organization, @invalid_attrs)
      assert organization == Organizations.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Organizations.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Organizations.change_organization(organization)
    end
  end

  describe "dev_organizations" do
    alias Search1.Organizations.DevOrganization

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def dev_organization_fixture(attrs \\ %{}) do
      {:ok, dev_organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_dev_organization()

      dev_organization
    end

    test "list_dev_organizations/0 returns all dev_organizations" do
      dev_organization = dev_organization_fixture()
      assert Organizations.list_dev_organizations() == [dev_organization]
    end

    test "get_dev_organization!/1 returns the dev_organization with given id" do
      dev_organization = dev_organization_fixture()
      assert Organizations.get_dev_organization!(dev_organization.id) == dev_organization
    end

    test "create_dev_organization/1 with valid data creates a dev_organization" do
      assert {:ok, %DevOrganization{} = dev_organization} = Organizations.create_dev_organization(@valid_attrs)
    end

    test "create_dev_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_dev_organization(@invalid_attrs)
    end

    test "update_dev_organization/2 with valid data updates the dev_organization" do
      dev_organization = dev_organization_fixture()
      assert {:ok, %DevOrganization{} = dev_organization} = Organizations.update_dev_organization(dev_organization, @update_attrs)
    end

    test "update_dev_organization/2 with invalid data returns error changeset" do
      dev_organization = dev_organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_dev_organization(dev_organization, @invalid_attrs)
      assert dev_organization == Organizations.get_dev_organization!(dev_organization.id)
    end

    test "delete_dev_organization/1 deletes the dev_organization" do
      dev_organization = dev_organization_fixture()
      assert {:ok, %DevOrganization{}} = Organizations.delete_dev_organization(dev_organization)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_dev_organization!(dev_organization.id) end
    end

    test "change_dev_organization/1 returns a dev_organization changeset" do
      dev_organization = dev_organization_fixture()
      assert %Ecto.Changeset{} = Organizations.change_dev_organization(dev_organization)
    end
  end
end
