defmodule Search1.Repo.Migrations.CreateMechanisms do
  use Ecto.Migration

  def change do
    create table(:mechanisms) do
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:mechanisms, [:item_id])
  end
end
