defmodule ShopeeShopCrawlerWeb.AppleStoreController do
  use ShopeeShopCrawlerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", products: getData())
  end

  def show(conn, _params) do
    render(conn, "show.html", messenger: getData())
  end

  defp getData() do
    urlShop = "https://shopee.vn/api/v4/search/search_items?by=pop&entry_point=ShopBySearch&limit=50&match_id=88201679&newest=0&order=desc&page_type=shop&scenario=PAGE_OTHERS&version=2"
    productItems = ShopeeShopCrawler.ShopCrawler.getProductItems(urlShop)
    result = processResponseBody(productItems)
    result
  end

  defp processResponseBody(body) do
    Enum.map(body, fn(item) ->
      item_basic = item["item_basic"]
      %{
        name: item_basic["name"],
        image: "https://cf.shopee.vn/file/" <> item_basic["image"],
        currency: item_basic["currency"],
        stock: item_basic["stock"],
        sold: item_basic["sold"],
        view_count: item_basic["view_count"],
        brand: item_basic["brand"],
        price: round(item_basic["price"] / 100000),
        price_before_discount: round(item_basic["price_before_discount"] / 100000),
        discount: item_basic["discount"],
        shop_location: item_basic["shop_location"]
      }
    end)
  end
end
