defmodule Search1.Organizations.DevOrganization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dev_organizations" do
    belongs_to :development, Search1.Developments.Development
    belongs_to :organization, Search1.Organizations.Organization

    timestamps()
  end

  @doc false
  def changeset(dev_organization, attrs) do
    dev_organization
    |> cast(attrs, [:development_id, :organization_id])
    |> validate_required([:development_id, :organization_id])
  end
end
