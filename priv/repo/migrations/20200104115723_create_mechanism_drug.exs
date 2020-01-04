defmodule Search1.Repo.Migrations.CreateMechanismDrug do
  use Ecto.Migration

  def change do
    create table(:mechanism_drug) do
      add :mechanism_id, references(:mechanisms, on_delete: :nothing)
      add :drug_id, references(:drugs, on_delete: :nothing)

      timestamps()
    end

    create index(:mechanism_drug, [:mechanism_id])
    create index(:mechanism_drug, [:drug_id])
  end
end
