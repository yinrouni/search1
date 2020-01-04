defmodule Search1.Repo.Migrations.CreateAdministrations do
  use Ecto.Migration

  def change do
    create table(:administrations) do
      add :name, :string

      timestamps()
    end

  end
end
