defmodule ShopeeShopCrawler.ShopCrawler do
  def getProductItems(url) do
    rawResponse = ShopeeShopCrawler.HttpClient.get(url)
    Poison.decode!(rawResponse)["items"]
  end
end
