defmodule Search1Web.MechanismDrugView do
  use Search1Web, :view
  alias Search1Web.MechanismDrugView

  def render("index.json", %{mechanism_drug: mechanism_drug}) do
    %{data: render_many(mechanism_drug, MechanismDrugView, "mechanism_drug.json")}
  end

  def render("show.json", %{mechanism_drug: mechanism_drug}) do
    %{data: render_one(mechanism_drug, MechanismDrugView, "mechanism_drug.json")}
  end

  def render("mechanism_drug.json", %{mechanism_drug: mechanism_drug}) do
    %{id: mechanism_drug.id}
  end
end
