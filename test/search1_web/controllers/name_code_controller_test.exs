defmodule Search1Web.NameCodeControllerTest do
  use Search1Web.ConnCase

  alias Search1.Drugs
  alias Search1.Drugs.NameCode

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:name_code) do
    {:ok, name_code} = Drugs.create_name_code(@create_attrs)
    name_code
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all namecodes", %{conn: conn} do
      conn = get(conn, Routes.name_code_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create name_code" do
    test "renders name_code when data is valid", %{conn: conn} do
      conn = post(conn, Routes.name_code_path(conn, :create), name_code: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.name_code_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.name_code_path(conn, :create), name_code: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update name_code" do
    setup [:create_name_code]

    test "renders name_code when data is valid", %{conn: conn, name_code: %NameCode{id: id} = name_code} do
      conn = put(conn, Routes.name_code_path(conn, :update, name_code), name_code: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.name_code_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, name_code: name_code} do
      conn = put(conn, Routes.name_code_path(conn, :update, name_code), name_code: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete name_code" do
    setup [:create_name_code]

    test "deletes chosen name_code", %{conn: conn, name_code: name_code} do
      conn = delete(conn, Routes.name_code_path(conn, :delete, name_code))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.name_code_path(conn, :show, name_code))
      end
    end
  end

  defp create_name_code(_) do
    name_code = fixture(:name_code)
    {:ok, name_code: name_code}
  end
end
