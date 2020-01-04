defmodule Search1Web.NameBrandView do
  use Search1Web, :view
  alias Search1Web.NameBrandView

  def render("index.json", %{namebrands: namebrands}) do
    %{data: render_many(namebrands, NameBrandView, "name_brand.json")}
  end

  def render("show.json", %{name_brand: name_brand}) do
    %{data: render_one(name_brand, NameBrandView, "name_brand.json")}
  end

  def render("name_brand.json", %{name_brand: name_brand}) do
    %{id: name_brand.id,
      name: name_brand.name}
  end
end
