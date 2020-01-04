defmodule Search1.Drugs.Drug do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drugs" do
    belongs_to :item, Search1.Items.Item
    has_many :mechanism_drug, Search1.Drugs.MechanismDrug
    has_many :mechanisms, through: [:mechanism_drug, :mechanism];
    has_many :namecodes, Search1.Drugs.NameCode
    has_many :namebrands, Search1.Drugs.NameBrand
    has_many :namegenerics, Search1.Drugs.NameGeneric


    timestamps()
  end

  @doc false
  def changeset(drug, attrs) do
    drug
    |> cast(attrs, [])
    |> validate_required([])
  end
end
