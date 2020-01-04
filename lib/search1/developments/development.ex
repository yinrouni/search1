defmodule Search1.Developments.Development do
  use Ecto.Schema
  import Ecto.Changeset

  schema "developments" do
    field :is_active, :boolean, default: false
    field :year, :integer
    belongs_to :drug, Search1.Drugs.Drug
    belongs_to :condition, Search1.Developments.Condition
    belongs_to :phasehighst, Search1.Developments.PhaseHighest

    timestamps()
  end

  @doc false
  def changeset(development, attrs) do
    development
    |> cast(attrs, [:is_active, :year])
    |> validate_required([:is_active, :year])
  end
end