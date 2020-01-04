defmodule Search1Web.NameCodeView do
  use Search1Web, :view
  alias Search1Web.NameCodeView

  def render("index.json", %{namecodes: namecodes}) do
    %{data: render_many(namecodes, NameCodeView, "name_code.json")}
  end

  def render("show.json", %{name_code: name_code}) do
    %{data: render_one(name_code, NameCodeView, "name_code.json")}
  end

  def render("name_code.json", %{name_code: name_code}) do
    %{id: name_code.id,
      name: name_code.name}
  end
end
