defmodule Search1Web.MechanismDrugController do
  use Search1Web, :controller

  alias Search1.Drugs
  alias Search1.Drugs.MechanismDrug

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    mechanism_drug = Drugs.list_mechanism_drug()
    render(conn, "index.json", mechanism_drug: mechanism_drug)
  end

  def create(conn, %{"mechanism_drug" => mechanism_drug_params}) do
    with {:ok, %MechanismDrug{} = mechanism_drug} <- Drugs.create_mechanism_drug(mechanism_drug_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.mechanism_drug_path(conn, :show, mechanism_drug))
      |> render("show.json", mechanism_drug: mechanism_drug)
    end
  end

  def show(conn, %{"id" => id}) do
    mechanism_drug = Drugs.get_mechanism_drug!(id)
    render(conn, "show.json", mechanism_drug: mechanism_drug)
  end

  def update(conn, %{"id" => id, "mechanism_drug" => mechanism_drug_params}) do
    mechanism_drug = Drugs.get_mechanism_drug!(id)

    with {:ok, %MechanismDrug{} = mechanism_drug} <- Drugs.update_mechanism_drug(mechanism_drug, mechanism_drug_params) do
      render(conn, "show.json", mechanism_drug: mechanism_drug)
    end
  end

  def delete(conn, %{"id" => id}) do
    mechanism_drug = Drugs.get_mechanism_drug!(id)

    with {:ok, %MechanismDrug{}} <- Drugs.delete_mechanism_drug(mechanism_drug) do
      send_resp(conn, :no_content, "")
    end
  end
end
