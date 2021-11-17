defmodule ShopeeShopCrawler.HttpClient do
  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      _ -> []
    end
  end
end
