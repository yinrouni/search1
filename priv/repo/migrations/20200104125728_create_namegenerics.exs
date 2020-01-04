defmodule Search1.Repo.Migrations.CreateNamegenerics do
  use Ecto.Migration

  def change do
    create table(:namegenerics) do
      add :name, :string
      add :drug_id, references(:drugs, on_delete: :nothing)

      timestamps()
    end

    create index(:namegenerics, [:drug_id])
  end
end
