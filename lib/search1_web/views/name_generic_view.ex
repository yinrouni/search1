defmodule Search1Web.NameGenericView do
  use Search1Web, :view
  alias Search1Web.NameGenericView

  def render("index.json", %{namegenerics: namegenerics}) do
    %{data: render_many(namegenerics, NameGenericView, "name_generic.json")}
  end

  def render("show.json", %{name_generic: name_generic}) do
    %{data: render_one(name_generic, NameGenericView, "name_generic.json")}
  end

  def render("name_generic.json", %{name_generic: name_generic}) do
    %{id: name_generic.id,
      name: name_generic.name}
  end
end
