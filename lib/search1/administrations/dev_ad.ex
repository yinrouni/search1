defmodule Search1.Administrations.DevAd do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dev_ads" do
    belongs_to :development, Search1.Developments.Development
    belongs_to :administration, Search1.Administrations.Administration
    timestamps()
  end

  @doc false
  def changeset(dev_ad, attrs) do
    dev_ad
    |> cast(attrs, [:development_id, :administration_id])
    |> validate_required([:development_id, :administration_id])
  end
end
