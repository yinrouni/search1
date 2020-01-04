defmodule Search1Web.NameGenericController do
  use Search1Web, :controller

  alias Search1.Drugs
  alias Search1.Drugs.NameGeneric

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    namegenerics = Drugs.list_namegenerics()
    render(conn, "index.json", namegenerics: namegenerics)
  end

  def create(conn, %{"name_generic" => name_generic_params}) do
    with {:ok, %NameGeneric{} = name_generic} <- Drugs.create_name_generic(name_generic_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.name_generic_path(conn, :show, name_generic))
      |> render("show.json", name_generic: name_generic)
    end
  end

  def show(conn, %{"id" => id}) do
    name_generic = Drugs.get_name_generic!(id)
    render(conn, "show.json", name_generic: name_generic)
  end

  def update(conn, %{"id" => id, "name_generic" => name_generic_params}) do
    name_generic = Drugs.get_name_generic!(id)

    with {:ok, %NameGeneric{} = name_generic} <- Drugs.update_name_generic(name_generic, name_generic_params) do
      render(conn, "show.json", name_generic: name_generic)
    end
  end

  def delete(conn, %{"id" => id}) do
    name_generic = Drugs.get_name_generic!(id)

    with {:ok, %NameGeneric{}} <- Drugs.delete_name_generic(name_generic) do
      send_resp(conn, :no_content, "")
    end
  end
end
