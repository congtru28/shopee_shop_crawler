defmodule ShopeeShopCrawlerWeb.PageController do
  use ShopeeShopCrawlerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
