defmodule Search1Web.DevOrganizationView do
  use Search1Web, :view
  alias Search1Web.DevOrganizationView

  def render("index.json", %{dev_organizations: dev_organizations}) do
    %{data: render_many(dev_organizations, DevOrganizationView, "dev_organization.json")}
  end

  def render("show.json", %{dev_organization: dev_organization}) do
    %{data: render_one(dev_organization, DevOrganizationView, "dev_organization.json")}
  end

  def render("dev_organization.json", %{dev_organization: dev_organization}) do
    %{id: dev_organization.id}
  end
end
