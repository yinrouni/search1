defmodule Search1.Developments.PhaseHighest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "phasehighsts" do
    field :sort, :integer
    field :status, :string
    has_many :developments, Search1.Developments.Development

    timestamps()
  end

  @doc false
  def changeset(phase_highest, attrs) do
    phase_highest
    |> cast(attrs, [:sort, :status])
    |> validate_required([:sort, :status])
  end
end
