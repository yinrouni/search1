defmodule Search1Web.NameBrandController do
  use Search1Web, :controller

  alias Search1.Drugs
  alias Search1.Drugs.NameBrand

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    namebrands = Drugs.list_namebrands()
    render(conn, "index.json", namebrands: namebrands)
  end

  def create(conn, %{"name_brand" => name_brand_params}) do
    with {:ok, %NameBrand{} = name_brand} <- Drugs.create_name_brand(name_brand_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.name_brand_path(conn, :show, name_brand))
      |> render("show.json", name_brand: name_brand)
    end
  end

  def show(conn, %{"id" => id}) do
    name_brand = Drugs.get_name_brand!(id)
    render(conn, "show.json", name_brand: name_brand)
  end

  def update(conn, %{"id" => id, "name_brand" => name_brand_params}) do
    name_brand = Drugs.get_name_brand!(id)

    with {:ok, %NameBrand{} = name_brand} <- Drugs.update_name_brand(name_brand, name_brand_params) do
      render(conn, "show.json", name_brand: name_brand)
    end
  end

  def delete(conn, %{"id" => id}) do
    name_brand = Drugs.get_name_brand!(id)

    with {:ok, %NameBrand{}} <- Drugs.delete_name_brand(name_brand) do
      send_resp(conn, :no_content, "")
    end
  end
end
