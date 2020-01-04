defmodule Search1Web.MechanismControllerTest do
  use Search1Web.ConnCase

  alias Search1.Mechanisms

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:mechanism) do
    {:ok, mechanism} = Mechanisms.create_mechanism(@create_attrs)
    mechanism
  end

  describe "index" do
    test "lists all mechanisms", %{conn: conn} do
      conn = get(conn, Routes.mechanism_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Mechanisms"
    end
  end

  describe "new mechanism" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.mechanism_path(conn, :new))
      assert html_response(conn, 200) =~ "New Mechanism"
    end
  end

  describe "create mechanism" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mechanism_path(conn, :create), mechanism: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.mechanism_path(conn, :show, id)

      conn = get(conn, Routes.mechanism_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Mechanism"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.mechanism_path(conn, :create), mechanism: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Mechanism"
    end
  end

  describe "edit mechanism" do
    setup [:create_mechanism]

    test "renders form for editing chosen mechanism", %{conn: conn, mechanism: mechanism} do
      conn = get(conn, Routes.mechanism_path(conn, :edit, mechanism))
      assert html_response(conn, 200) =~ "Edit Mechanism"
    end
  end

  describe "update mechanism" do
    setup [:create_mechanism]

    test "redirects when data is valid", %{conn: conn, mechanism: mechanism} do
      conn = put(conn, Routes.mechanism_path(conn, :update, mechanism), mechanism: @update_attrs)
      assert redirected_to(conn) == Routes.mechanism_path(conn, :show, mechanism)

      conn = get(conn, Routes.mechanism_path(conn, :show, mechanism))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, mechanism: mechanism} do
      conn = put(conn, Routes.mechanism_path(conn, :update, mechanism), mechanism: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Mechanism"
    end
  end

  describe "delete mechanism" do
    setup [:create_mechanism]

    test "deletes chosen mechanism", %{conn: conn, mechanism: mechanism} do
      conn = delete(conn, Routes.mechanism_path(conn, :delete, mechanism))
      assert redirected_to(conn) == Routes.mechanism_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.mechanism_path(conn, :show, mechanism))
      end
    end
  end

  defp create_mechanism(_) do
    mechanism = fixture(:mechanism)
    {:ok, mechanism: mechanism}
  end
end
