defmodule Search1.Drugs.MechanismDrug do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mechanism_drug" do
    belongs_to :drug, Search1.Drugs.Drug
    belongs_to :mechanism, Search1.Mechanisms.Mechanism
    timestamps()
  end

  @doc false
  def changeset(mechanism_drug, attrs) do
    mechanism_drug
    |> cast(attrs, [])
    |> validate_required([])
  end
end
