defmodule Search1.Drugs.NameBrand do
  use Ecto.Schema
  import Ecto.Changeset

  schema "namebrands" do
    field :name, :string
    belongs_to :drug, Search1.Drugs.Drug

    timestamps()
  end

  @doc false
  def changeset(name_brand, attrs) do
    name_brand
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
