defmodule Search1Web.ConditionView do
  use Search1Web, :view
  alias Search1Web.ConditionView

  def render("index.json", %{conditions: conditions}) do
    %{data: render_many(conditions, ConditionView, "condition.json")}
  end

  def render("show.json", %{condition: condition}) do
    %{data: render_one(condition, ConditionView, "condition.json")}
  end

  def render("condition.json", %{condition: condition}) do
    %{id: condition.id,
      name: condition.name}
  end
end
