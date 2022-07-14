module DataManager
  class BrandManager

    def initialize()
    end

    def self.list_with_avarage_prices(brands)
      result = []
      brands.each do |brand|
        prices = Model.order(:average_price)
                      .select(:average_price)
                      .where(brand_id: brand.id)
        median_element = prices.length / 2
        result << {
          id: brand.id,
          name: brand.name,
          average_price: prices[median_element]&.[](:average_price) || "0.0"
        }
      end
      { data: result, status: true }
    rescue => e
      { data: [], status: false, message: e.message }
    end

    def self.list_models(brand_id)
      result = Model.select(:id, :name, :average_price)
                  .where(brand_id: brand_id.to_i)
      { data: result, status: true }
    rescue => e
      { data: [], status: false, message: e.message }
    end

    def self.create_register(params)
      params = JSON.parse(params).with_indifferent_access
      new_brand = Brand.create(params)
      return { data: new_brand, status: true } if new_brand

      raise StandardError, 'Failed to save record'
    rescue => e
      { data: [], status: false, message: e.message }
    end
  end
end