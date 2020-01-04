defmodule Search1Web.ConditionControllerTest do
  use Search1Web.ConnCase

  alias Search1.Developments
  alias Search1.Developments.Condition

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:condition) do
    {:ok, condition} = Developments.create_condition(@create_attrs)
    condition
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all conditions", %{conn: conn} do
      conn = get(conn, Routes.condition_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create condition" do
    test "renders condition when data is valid", %{conn: conn} do
      conn = post(conn, Routes.condition_path(conn, :create), condition: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.condition_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.condition_path(conn, :create), condition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update condition" do
    setup [:create_condition]

    test "renders condition when data is valid", %{conn: conn, condition: %Condition{id: id} = condition} do
      conn = put(conn, Routes.condition_path(conn, :update, condition), condition: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.condition_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, condition: condition} do
      conn = put(conn, Routes.condition_path(conn, :update, condition), condition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete condition" do
    setup [:create_condition]

    test "deletes chosen condition", %{conn: conn, condition: condition} do
      conn = delete(conn, Routes.condition_path(conn, :delete, condition))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.condition_path(conn, :show, condition))
      end
    end
  end

  defp create_condition(_) do
    condition = fixture(:condition)
    {:ok, condition: condition}
  end
end
