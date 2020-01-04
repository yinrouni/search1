defmodule Search1.Repo.Migrations.CreatePhasehighsts do
  use Ecto.Migration

  def change do
    create table(:phasehighsts) do
      add :sort, :integer
      add :status, :string

      timestamps()
    end

  end
end
