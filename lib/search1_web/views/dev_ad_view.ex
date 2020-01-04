defmodule Search1Web.DevAdView do
  use Search1Web, :view
  alias Search1Web.DevAdView

  def render("index.json", %{dev_ads: dev_ads}) do
    %{data: render_many(dev_ads, DevAdView, "dev_ad.json")}
  end

  def render("show.json", %{dev_ad: dev_ad}) do
    %{data: render_one(dev_ad, DevAdView, "dev_ad.json")}
  end

  def render("dev_ad.json", %{dev_ad: dev_ad}) do
    %{id: dev_ad.id}
  end
end
