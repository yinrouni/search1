defmodule Search1Web.DevOrganizationControllerTest do
  use Search1Web.ConnCase

  alias Search1.Organizations
  alias Search1.Organizations.DevOrganization

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:dev_organization) do
    {:ok, dev_organization} = Organizations.create_dev_organization(@create_attrs)
    dev_organization
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dev_organizations", %{conn: conn} do
      conn = get(conn, Routes.dev_organization_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dev_organization" do
    test "renders dev_organization when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dev_organization_path(conn, :create), dev_organization: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dev_organization_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dev_organization_path(conn, :create), dev_organization: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dev_organization" do
    setup [:create_dev_organization]

    test "renders dev_organization when data is valid", %{conn: conn, dev_organization: %DevOrganization{id: id} = dev_organization} do
      conn = put(conn, Routes.dev_organization_path(conn, :update, dev_organization), dev_organization: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dev_organization_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dev_organization: dev_organization} do
      conn = put(conn, Routes.dev_organization_path(conn, :update, dev_organization), dev_organization: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dev_organization" do
    setup [:create_dev_organization]

    test "deletes chosen dev_organization", %{conn: conn, dev_organization: dev_organization} do
      conn = delete(conn, Routes.dev_organization_path(conn, :delete, dev_organization))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dev_organization_path(conn, :show, dev_organization))
      end
    end
  end

  defp create_dev_organization(_) do
    dev_organization = fixture(:dev_organization)
    {:ok, dev_organization: dev_organization}
  end
end
