defmodule Search1.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :is_drug, :boolean, default: false
    field :name, :string
    has_one :drug, Search1.Drugs.Drug
    has_one :mechanism, Search1.Mechanisms.Mechanism


    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :is_drug])
    |> validate_required([:name, :is_drug])
  end
end
