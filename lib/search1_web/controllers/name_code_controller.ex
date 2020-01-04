defmodule Search1Web.NameCodeController do
  use Search1Web, :controller

  alias Search1.Drugs
  alias Search1.Drugs.NameCode

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    namecodes = Drugs.list_namecodes()
    render(conn, "index.json", namecodes: namecodes)
  end

  def create(conn, %{"name_code" => name_code_params}) do
    with {:ok, %NameCode{} = name_code} <- Drugs.create_name_code(name_code_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.name_code_path(conn, :show, name_code))
      |> render("show.json", name_code: name_code)
    end
  end

  def show(conn, %{"id" => id}) do
    name_code = Drugs.get_name_code!(id)
    render(conn, "show.json", name_code: name_code)
  end

  def update(conn, %{"id" => id, "name_code" => name_code_params}) do
    name_code = Drugs.get_name_code!(id)

    with {:ok, %NameCode{} = name_code} <- Drugs.update_name_code(name_code, name_code_params) do
      render(conn, "show.json", name_code: name_code)
    end
  end

  def delete(conn, %{"id" => id}) do
    name_code = Drugs.get_name_code!(id)

    with {:ok, %NameCode{}} <- Drugs.delete_name_code(name_code) do
      send_resp(conn, :no_content, "")
    end
  end
end
