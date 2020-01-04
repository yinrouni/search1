defmodule Search1Web.DevAdControllerTest do
  use Search1Web.ConnCase

  alias Search1.Administrations
  alias Search1.Administrations.DevAd

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:dev_ad) do
    {:ok, dev_ad} = Administrations.create_dev_ad(@create_attrs)
    dev_ad
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dev_ads", %{conn: conn} do
      conn = get(conn, Routes.dev_ad_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dev_ad" do
    test "renders dev_ad when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dev_ad_path(conn, :create), dev_ad: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dev_ad_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dev_ad_path(conn, :create), dev_ad: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dev_ad" do
    setup [:create_dev_ad]

    test "renders dev_ad when data is valid", %{conn: conn, dev_ad: %DevAd{id: id} = dev_ad} do
      conn = put(conn, Routes.dev_ad_path(conn, :update, dev_ad), dev_ad: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dev_ad_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dev_ad: dev_ad} do
      conn = put(conn, Routes.dev_ad_path(conn, :update, dev_ad), dev_ad: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dev_ad" do
    setup [:create_dev_ad]

    test "deletes chosen dev_ad", %{conn: conn, dev_ad: dev_ad} do
      conn = delete(conn, Routes.dev_ad_path(conn, :delete, dev_ad))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dev_ad_path(conn, :show, dev_ad))
      end
    end
  end

  defp create_dev_ad(_) do
    dev_ad = fixture(:dev_ad)
    {:ok, dev_ad: dev_ad}
  end
end
