defmodule Search1.Repo.Migrations.CreateDrugs do
  use Ecto.Migration

  def change do
    create table(:drugs) do
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:drugs, [:item_id])
  end
end
