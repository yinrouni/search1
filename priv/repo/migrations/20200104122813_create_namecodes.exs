defmodule Search1.Repo.Migrations.CreateNamecodes do
  use Ecto.Migration

  def change do
    create table(:namecodes) do
      add :name, :string
      add :drug_id, references(:drugs, on_delete: :nothing)

      timestamps()
    end

    create index(:namecodes, [:drug_id])
  end
end
