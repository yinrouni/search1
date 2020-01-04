defmodule Search1.Drugs.NameCode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "namecodes" do
    field :name, :string
    belongs_to :drug, Search1.Drugs.Drug

    timestamps()
  end

  @doc false
  def changeset(name_code, attrs) do
    name_code
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
