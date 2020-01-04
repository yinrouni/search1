defmodule Search1.Repo.Migrations.AddPhaseReference do
  use Ecto.Migration

  def change do
    alter table("developments") do
	add :phasehighst_id, references(:phasehighsts)
    end

  end
end
