defmodule Search1.Repo.Migrations.CreateConditions do
  use Ecto.Migration

  def change do
    create table(:conditions) do
      add :name, :string

      timestamps()
    end

  end
end
