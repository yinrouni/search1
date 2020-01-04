defmodule Search1Web.NameGenericControllerTest do
  use Search1Web.ConnCase

  alias Search1.Drugs
  alias Search1.Drugs.NameGeneric

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:name_generic) do
    {:ok, name_generic} = Drugs.create_name_generic(@create_attrs)
    name_generic
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all namegenerics", %{conn: conn} do
      conn = get(conn, Routes.name_generic_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create name_generic" do
    test "renders name_generic when data is valid", %{conn: conn} do
      conn = post(conn, Routes.name_generic_path(conn, :create), name_generic: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.name_generic_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.name_generic_path(conn, :create), name_generic: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update name_generic" do
    setup [:create_name_generic]

    test "renders name_generic when data is valid", %{conn: conn, name_generic: %NameGeneric{id: id} = name_generic} do
      conn = put(conn, Routes.name_generic_path(conn, :update, name_generic), name_generic: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.name_generic_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, name_generic: name_generic} do
      conn = put(conn, Routes.name_generic_path(conn, :update, name_generic), name_generic: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete name_generic" do
    setup [:create_name_generic]

    test "deletes chosen name_generic", %{conn: conn, name_generic: name_generic} do
      conn = delete(conn, Routes.name_generic_path(conn, :delete, name_generic))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.name_generic_path(conn, :show, name_generic))
      end
    end
  end

  defp create_name_generic(_) do
    name_generic = fixture(:name_generic)
    {:ok, name_generic: name_generic}
  end
end
