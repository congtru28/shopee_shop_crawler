defmodule ShopeeShopCrawlerWeb.AppleStoreView do
  use ShopeeShopCrawlerWeb, :view

  def numberDelimit(price) do
    Number.Delimit.number_to_delimited(price, precision: 0, delimiter: ".")
  end
end
