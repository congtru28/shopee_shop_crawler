defmodule ShopeeShopCrawler.Repo do
  use Ecto.Repo,
    otp_app: :shopee_shop_crawler,
    adapter: Ecto.Adapters.Postgres
end
