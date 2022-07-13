module DataManager
  class ManagerBrand
    attr_reader :brands

    def initialize(brands)
      @brands = brands
    end

    def list_brands_with_avarage_prices
      result = []
      brands.each do |brand|
        prices = Model.order(:average_price)
                      .select(:average_price)
                      .where(brand_id: brand.id)
        median_element = prices.length / 2
        result << { id: brand.id, name: brand.name, average_price:  prices[median_element]["average_price"] }
      end
      { data: result, status: true }
    rescue => e
      { data: [], status: false, message: e.message }
    end
  end
end