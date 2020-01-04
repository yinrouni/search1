defmodule Search1Web.AdministrationControllerTest do
  use Search1Web.ConnCase

  alias Search1.Administrations

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:administration) do
    {:ok, administration} = Administrations.create_administration(@create_attrs)
    administration
  end

  describe "index" do
    test "lists all administrations", %{conn: conn} do
      conn = get(conn, Routes.administration_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Administrations"
    end
  end

  describe "new administration" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.administration_path(conn, :new))
      assert html_response(conn, 200) =~ "New Administration"
    end
  end

  describe "create administration" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.administration_path(conn, :create), administration: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.administration_path(conn, :show, id)

      conn = get(conn, Routes.administration_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Administration"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.administration_path(conn, :create), administration: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Administration"
    end
  end

  describe "edit administration" do
    setup [:create_administration]

    test "renders form for editing chosen administration", %{conn: conn, administration: administration} do
      conn = get(conn, Routes.administration_path(conn, :edit, administration))
      assert html_response(conn, 200) =~ "Edit Administration"
    end
  end

  describe "update administration" do
    setup [:create_administration]

    test "redirects when data is valid", %{conn: conn, administration: administration} do
      conn = put(conn, Routes.administration_path(conn, :update, administration), administration: @update_attrs)
      assert redirected_to(conn) == Routes.administration_path(conn, :show, administration)

      conn = get(conn, Routes.administration_path(conn, :show, administration))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, administration: administration} do
      conn = put(conn, Routes.administration_path(conn, :update, administration), administration: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Administration"
    end
  end

  describe "delete administration" do
    setup [:create_administration]

    test "deletes chosen administration", %{conn: conn, administration: administration} do
      conn = delete(conn, Routes.administration_path(conn, :delete, administration))
      assert redirected_to(conn) == Routes.administration_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.administration_path(conn, :show, administration))
      end
    end
  end

  defp create_administration(_) do
    administration = fixture(:administration)
    {:ok, administration: administration}
  end
end
