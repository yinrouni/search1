defmodule Search1Web.MechanismController do
  use Search1Web, :controller

  alias Search1.Mechanisms
  alias Search1.Mechanisms.Mechanism

  def index(conn, _params) do
    mechanisms = Mechanisms.list_mechanisms()
    render(conn, "index.html", mechanisms: mechanisms)
  end

  def new(conn, _params) do
    changeset = Mechanisms.change_mechanism(%Mechanism{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mechanism" => mechanism_params}) do
    case Mechanisms.create_mechanism(mechanism_params) do
      {:ok, mechanism} ->
        conn
        |> put_flash(:info, "Mechanism created successfully.")
        |> redirect(to: Routes.mechanism_path(conn, :show, mechanism))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mechanism = Mechanisms.get_mechanism!(id)
    render(conn, "show.html", mechanism: mechanism)
  end

  def edit(conn, %{"id" => id}) do
    mechanism = Mechanisms.get_mechanism!(id)
    changeset = Mechanisms.change_mechanism(mechanism)
    render(conn, "edit.html", mechanism: mechanism, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mechanism" => mechanism_params}) do
    mechanism = Mechanisms.get_mechanism!(id)

    case Mechanisms.update_mechanism(mechanism, mechanism_params) do
      {:ok, mechanism} ->
        conn
        |> put_flash(:info, "Mechanism updated successfully.")
        |> redirect(to: Routes.mechanism_path(conn, :show, mechanism))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", mechanism: mechanism, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mechanism = Mechanisms.get_mechanism!(id)
    {:ok, _mechanism} = Mechanisms.delete_mechanism(mechanism)

    conn
    |> put_flash(:info, "Mechanism deleted successfully.")
    |> redirect(to: Routes.mechanism_path(conn, :index))
  end
end
