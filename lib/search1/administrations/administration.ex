defmodule Search1.Administrations.Administration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "administrations" do
    field :name, :string
    has_many :dev_ads, Search1.Administrations.DevAd
    has_many :developments, through: [:dev_ads, :development]

    timestamps()
  end

  @doc false
  def changeset(administration, attrs) do
    administration
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
