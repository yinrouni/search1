defmodule Search1.Repo.Migrations.CreateDevOrganizations do
  use Ecto.Migration

  def change do
    create table(:dev_organizations) do
      add :development_id, references(:developments, on_delete: :nothing)
      add :organization_id, references(:organizations, on_delete: :nothing)

      timestamps()
    end

    create index(:dev_organizations, [:development_id])
    create index(:dev_organizations, [:organization_id])
  end
end
