defmodule Search1.Repo.Migrations.CreateNamebrands do
  use Ecto.Migration

  def change do
    create table(:namebrands) do
      add :name, :string
      add :drug_id, references(:drugs, on_delete: :nothing)

      timestamps()
    end

    create index(:namebrands, [:drug_id])
  end
end
