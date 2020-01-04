defmodule Search1Web.PhaseHighestControllerTest do
  use Search1Web.ConnCase

  alias Search1.Developments
  alias Search1.Developments.PhaseHighest

  @create_attrs %{
    sort: 42,
    status: "some status"
  }
  @update_attrs %{
    sort: 43,
    status: "some updated status"
  }
  @invalid_attrs %{sort: nil, status: nil}

  def fixture(:phase_highest) do
    {:ok, phase_highest} = Developments.create_phase_highest(@create_attrs)
    phase_highest
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all phasehighsts", %{conn: conn} do
      conn = get(conn, Routes.phase_highest_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create phase_highest" do
    test "renders phase_highest when data is valid", %{conn: conn} do
      conn = post(conn, Routes.phase_highest_path(conn, :create), phase_highest: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.phase_highest_path(conn, :show, id))

      assert %{
               "id" => id,
               "sort" => 42,
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.phase_highest_path(conn, :create), phase_highest: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update phase_highest" do
    setup [:create_phase_highest]

    test "renders phase_highest when data is valid", %{conn: conn, phase_highest: %PhaseHighest{id: id} = phase_highest} do
      conn = put(conn, Routes.phase_highest_path(conn, :update, phase_highest), phase_highest: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.phase_highest_path(conn, :show, id))

      assert %{
               "id" => id,
               "sort" => 43,
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, phase_highest: phase_highest} do
      conn = put(conn, Routes.phase_highest_path(conn, :update, phase_highest), phase_highest: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete phase_highest" do
    setup [:create_phase_highest]

    test "deletes chosen phase_highest", %{conn: conn, phase_highest: phase_highest} do
      conn = delete(conn, Routes.phase_highest_path(conn, :delete, phase_highest))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.phase_highest_path(conn, :show, phase_highest))
      end
    end
  end

  defp create_phase_highest(_) do
    phase_highest = fixture(:phase_highest)
    {:ok, phase_highest: phase_highest}
  end
end
