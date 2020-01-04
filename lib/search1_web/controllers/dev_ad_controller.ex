defmodule Search1Web.DevAdController do
  use Search1Web, :controller

  alias Search1.Administrations
  alias Search1.Administrations.DevAd

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    dev_ads = Administrations.list_dev_ads()
    render(conn, "index.json", dev_ads: dev_ads)
  end

  def create(conn, %{"dev_ad" => dev_ad_params}) do
    with {:ok, %DevAd{} = dev_ad} <- Administrations.create_dev_ad(dev_ad_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.dev_ad_path(conn, :show, dev_ad))
      |> render("show.json", dev_ad: dev_ad)
    end
  end

  def show(conn, %{"id" => id}) do
    dev_ad = Administrations.get_dev_ad!(id)
    render(conn, "show.json", dev_ad: dev_ad)
  end

  def update(conn, %{"id" => id, "dev_ad" => dev_ad_params}) do
    dev_ad = Administrations.get_dev_ad!(id)

    with {:ok, %DevAd{} = dev_ad} <- Administrations.update_dev_ad(dev_ad, dev_ad_params) do
      render(conn, "show.json", dev_ad: dev_ad)
    end
  end

  def delete(conn, %{"id" => id}) do
    dev_ad = Administrations.get_dev_ad!(id)

    with {:ok, %DevAd{}} <- Administrations.delete_dev_ad(dev_ad) do
      send_resp(conn, :no_content, "")
    end
  end
end
