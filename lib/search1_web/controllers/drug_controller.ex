defmodule Search1Web.DrugController do
  use Search1Web, :controller

  alias Search1.Drugs
  alias Search1.Drugs.Drug

  def index(conn, _params) do
    drugs = Drugs.list_drugs()
    render(conn, "index.html", drugs: drugs)
  end

  def new(conn, _params) do
    changeset = Drugs.change_drug(%Drug{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"drug" => drug_params}) do
    case Drugs.create_drug(drug_params) do
      {:ok, drug} ->
        conn
        |> put_flash(:info, "Drug created successfully.")
        |> redirect(to: Routes.drug_path(conn, :show, drug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drug = Drugs.get_drug!(id)
    render(conn, "show.html", drug: drug)
  end

  def edit(conn, %{"id" => id}) do
    drug = Drugs.get_drug!(id)
    changeset = Drugs.change_drug(drug)
    render(conn, "edit.html", drug: drug, changeset: changeset)
  end

  def update(conn, %{"id" => id, "drug" => drug_params}) do
    drug = Drugs.get_drug!(id)

    case Drugs.update_drug(drug, drug_params) do
      {:ok, drug} ->
        conn
        |> put_flash(:info, "Drug updated successfully.")
        |> redirect(to: Routes.drug_path(conn, :show, drug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", drug: drug, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drug = Drugs.get_drug!(id)
    {:ok, _drug} = Drugs.delete_drug(drug)

    conn
    |> put_flash(:info, "Drug deleted successfully.")
    |> redirect(to: Routes.drug_path(conn, :index))
  end
end
