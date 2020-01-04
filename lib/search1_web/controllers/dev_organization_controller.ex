defmodule Search1Web.DevOrganizationController do
  use Search1Web, :controller

  alias Search1.Organizations
  alias Search1.Organizations.DevOrganization

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    dev_organizations = Organizations.list_dev_organizations()
    render(conn, "index.json", dev_organizations: dev_organizations)
  end

  def create(conn, %{"dev_organization" => dev_organization_params}) do
    with {:ok, %DevOrganization{} = dev_organization} <- Organizations.create_dev_organization(dev_organization_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.dev_organization_path(conn, :show, dev_organization))
      |> render("show.json", dev_organization: dev_organization)
    end
  end

  def show(conn, %{"id" => id}) do
    dev_organization = Organizations.get_dev_organization!(id)
    render(conn, "show.json", dev_organization: dev_organization)
  end

  def update(conn, %{"id" => id, "dev_organization" => dev_organization_params}) do
    dev_organization = Organizations.get_dev_organization!(id)

    with {:ok, %DevOrganization{} = dev_organization} <- Organizations.update_dev_organization(dev_organization, dev_organization_params) do
      render(conn, "show.json", dev_organization: dev_organization)
    end
  end

  def delete(conn, %{"id" => id}) do
    dev_organization = Organizations.get_dev_organization!(id)

    with {:ok, %DevOrganization{}} <- Organizations.delete_dev_organization(dev_organization) do
      send_resp(conn, :no_content, "")
    end
  end
end
