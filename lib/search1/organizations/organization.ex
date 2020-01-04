defmodule Search1.Organizations.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organizations" do
    field :name, :string
    has_many :dev_organizations, Search1.Organizations.DevOrganization
    has_many :developments, through: [:dev_organizations, :development]

    timestamps()
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
