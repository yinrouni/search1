defmodule Search1.Drugs.NameGeneric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "namegenerics" do
    field :name, :string
    belongs_to :drug, Search1.Drugs.Drug

    timestamps()
  end

  @doc false
  def changeset(name_generic, attrs) do
    name_generic
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
