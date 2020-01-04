defmodule Search1.Repo.Migrations.CreateDevAds do
  use Ecto.Migration

  def change do
    create table(:dev_ads) do
      add :development_id, references(:developments, on_delete: :nothing)
      add :administration_id, references(:administrations, on_delete: :nothing)

      timestamps()
    end

    create index(:dev_ads, [:development_id])
    create index(:dev_ads, [:administration_id])
  end
end
