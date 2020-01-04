defmodule Search1Web.MechanismDrugControllerTest do
  use Search1Web.ConnCase

  alias Search1.Drugs
  alias Search1.Drugs.MechanismDrug

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:mechanism_drug) do
    {:ok, mechanism_drug} = Drugs.create_mechanism_drug(@create_attrs)
    mechanism_drug
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mechanism_drug", %{conn: conn} do
      conn = get(conn, Routes.mechanism_drug_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mechanism_drug" do
    test "renders mechanism_drug when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mechanism_drug_path(conn, :create), mechanism_drug: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.mechanism_drug_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.mechanism_drug_path(conn, :create), mechanism_drug: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update mechanism_drug" do
    setup [:create_mechanism_drug]

    test "renders mechanism_drug when data is valid", %{conn: conn, mechanism_drug: %MechanismDrug{id: id} = mechanism_drug} do
      conn = put(conn, Routes.mechanism_drug_path(conn, :update, mechanism_drug), mechanism_drug: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.mechanism_drug_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, mechanism_drug: mechanism_drug} do
      conn = put(conn, Routes.mechanism_drug_path(conn, :update, mechanism_drug), mechanism_drug: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete mechanism_drug" do
    setup [:create_mechanism_drug]

    test "deletes chosen mechanism_drug", %{conn: conn, mechanism_drug: mechanism_drug} do
      conn = delete(conn, Routes.mechanism_drug_path(conn, :delete, mechanism_drug))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.mechanism_drug_path(conn, :show, mechanism_drug))
      end
    end
  end

  defp create_mechanism_drug(_) do
    mechanism_drug = fixture(:mechanism_drug)
    {:ok, mechanism_drug: mechanism_drug}
  end
end
