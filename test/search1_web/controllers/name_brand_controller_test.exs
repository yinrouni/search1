defmodule Search1Web.NameBrandControllerTest do
  use Search1Web.ConnCase

  alias Search1.Drugs
  alias Search1.Drugs.NameBrand

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:name_brand) do
    {:ok, name_brand} = Drugs.create_name_brand(@create_attrs)
    name_brand
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all namebrands", %{conn: conn} do
      conn = get(conn, Routes.name_brand_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create name_brand" do
    test "renders name_brand when data is valid", %{conn: conn} do
      conn = post(conn, Routes.name_brand_path(conn, :create), name_brand: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.name_brand_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.name_brand_path(conn, :create), name_brand: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update name_brand" do
    setup [:create_name_brand]

    test "renders name_brand when data is valid", %{conn: conn, name_brand: %NameBrand{id: id} = name_brand} do
      conn = put(conn, Routes.name_brand_path(conn, :update, name_brand), name_brand: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.name_brand_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, name_brand: name_brand} do
      conn = put(conn, Routes.name_brand_path(conn, :update, name_brand), name_brand: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete name_brand" do
    setup [:create_name_brand]

    test "deletes chosen name_brand", %{conn: conn, name_brand: name_brand} do
      conn = delete(conn, Routes.name_brand_path(conn, :delete, name_brand))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.name_brand_path(conn, :show, name_brand))
      end
    end
  end

  defp create_name_brand(_) do
    name_brand = fixture(:name_brand)
    {:ok, name_brand: name_brand}
  end
end
