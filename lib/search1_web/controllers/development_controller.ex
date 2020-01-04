defmodule Search1Web.DevelopmentController do
  use Search1Web, :controller

  alias Search1.Developments
  alias Search1.Developments.Development

  def index(conn, _params) do
    developments = Developments.list_developments()
    render(conn, "index.html", developments: developments)
  end

  def new(conn, _params) do
    changeset = Developments.change_development(%Development{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"development" => development_params}) do
    case Developments.create_development(development_params) do
      {:ok, development} ->
        conn
        |> put_flash(:info, "Development created successfully.")
        |> redirect(to: Routes.development_path(conn, :show, development))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    development = Developments.get_development!(id)
    render(conn, "show.html", development: development)
  end

  def edit(conn, %{"id" => id}) do
    development = Developments.get_development!(id)
    changeset = Developments.change_development(development)
    render(conn, "edit.html", development: development, changeset: changeset)
  end

  def update(conn, %{"id" => id, "development" => development_params}) do
    development = Developments.get_development!(id)

    case Developments.update_development(development, development_params) do
      {:ok, development} ->
        conn
        |> put_flash(:info, "Development updated successfully.")
        |> redirect(to: Routes.development_path(conn, :show, development))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", development: development, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    development = Developments.get_development!(id)
    {:ok, _development} = Developments.delete_development(development)

    conn
    |> put_flash(:info, "Development deleted successfully.")
    |> redirect(to: Routes.development_path(conn, :index))
  end
end
