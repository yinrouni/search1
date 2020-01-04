defmodule Search1Web.PageController do
  use Search1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
