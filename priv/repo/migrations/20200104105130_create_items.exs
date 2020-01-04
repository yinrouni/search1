defmodule Search1.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :is_drug, :boolean, default: false, null: false

      timestamps()
    end

  end
end
