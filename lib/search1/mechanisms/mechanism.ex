defmodule Search1.Mechanisms.Mechanism do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mechanisms" do
    belongs_to :item, Search1.Items.Item
    has_many :mechanism_drug, Search1.Drugs.MechanismDrug
    has_many :drugs, through: [:mechanism_drug, :drug]

    timestamps()
  end

  @doc false
  def changeset(mechanism, attrs) do
    mechanism
    |> cast(attrs, [])
    |> validate_required([])
  end
end
