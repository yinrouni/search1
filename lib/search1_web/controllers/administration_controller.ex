defmodule Search1Web.AdministrationController do
  use Search1Web, :controller

  alias Search1.Administrations
  alias Search1.Administrations.Administration

  def index(conn, _params) do
    administrations = Administrations.list_administrations()
    render(conn, "index.html", administrations: administrations)
  end

  def new(conn, _params) do
    changeset = Administrations.change_administration(%Administration{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"administration" => administration_params}) do
    case Administrations.create_administration(administration_params) do
      {:ok, administration} ->
        conn
        |> put_flash(:info, "Administration created successfully.")
        |> redirect(to: Routes.administration_path(conn, :show, administration))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    administration = Administrations.get_administration!(id)
    render(conn, "show.html", administration: administration)
  end

  def edit(conn, %{"id" => id}) do
    administration = Administrations.get_administration!(id)
    changeset = Administrations.change_administration(administration)
    render(conn, "edit.html", administration: administration, changeset: changeset)
  end

  def update(conn, %{"id" => id, "administration" => administration_params}) do
    administration = Administrations.get_administration!(id)

    case Administrations.update_administration(administration, administration_params) do
      {:ok, administration} ->
        conn
        |> put_flash(:info, "Administration updated successfully.")
        |> redirect(to: Routes.administration_path(conn, :show, administration))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", administration: administration, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    administration = Administrations.get_administration!(id)
    {:ok, _administration} = Administrations.delete_administration(administration)

    conn
    |> put_flash(:info, "Administration deleted successfully.")
    |> redirect(to: Routes.administration_path(conn, :index))
  end
end
