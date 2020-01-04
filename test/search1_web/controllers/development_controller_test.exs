defmodule Search1Web.DevelopmentControllerTest do
  use Search1Web.ConnCase

  alias Search1.Developments

  @create_attrs %{is_active: true, year: 42}
  @update_attrs %{is_active: false, year: 43}
  @invalid_attrs %{is_active: nil, year: nil}

  def fixture(:development) do
    {:ok, development} = Developments.create_development(@create_attrs)
    development
  end

  describe "index" do
    test "lists all developments", %{conn: conn} do
      conn = get(conn, Routes.development_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Developments"
    end
  end

  describe "new development" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.development_path(conn, :new))
      assert html_response(conn, 200) =~ "New Development"
    end
  end

  describe "create development" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.development_path(conn, :create), development: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.development_path(conn, :show, id)

      conn = get(conn, Routes.development_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Development"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.development_path(conn, :create), development: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Development"
    end
  end

  describe "edit development" do
    setup [:create_development]

    test "renders form for editing chosen development", %{conn: conn, development: development} do
      conn = get(conn, Routes.development_path(conn, :edit, development))
      assert html_response(conn, 200) =~ "Edit Development"
    end
  end

  describe "update development" do
    setup [:create_development]

    test "redirects when data is valid", %{conn: conn, development: development} do
      conn = put(conn, Routes.development_path(conn, :update, development), development: @update_attrs)
      assert redirected_to(conn) == Routes.development_path(conn, :show, development)

      conn = get(conn, Routes.development_path(conn, :show, development))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, development: development} do
      conn = put(conn, Routes.development_path(conn, :update, development), development: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Development"
    end
  end

  describe "delete development" do
    setup [:create_development]

    test "deletes chosen development", %{conn: conn, development: development} do
      conn = delete(conn, Routes.development_path(conn, :delete, development))
      assert redirected_to(conn) == Routes.development_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.development_path(conn, :show, development))
      end
    end
  end

  defp create_development(_) do
    development = fixture(:development)
    {:ok, development: development}
  end
end
