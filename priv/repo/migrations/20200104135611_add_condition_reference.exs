defmodule Search1.Repo.Migrations.AddConditionReference do
  use Ecto.Migration

  def change do
    alter table("developments") do
       add :condition_id, references(:conditions)
    end

  end
end
