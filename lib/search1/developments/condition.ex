defmodule Search1.Developments.Condition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conditions" do
    field :name, :string
    has_many :developments, Search1.Developments.Development

    timestamps()
  end

  @doc false
  def changeset(condition, attrs) do
    condition
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
