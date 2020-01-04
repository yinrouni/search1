defmodule Search1.Repo.Migrations.CreateDevelopments do
  use Ecto.Migration

  def change do
    create table(:developments) do
      add :is_active, :boolean, default: false, null: false
      add :year, :integer
      add :drug_id, references(:drugs, on_delete: :nothing)

      timestamps()
    end

    create index(:developments, [:drug_id])
  end
end
