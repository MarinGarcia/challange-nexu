class BrandsController < ApplicationController
  def index
    brands = Brand.all.select(:id, :name)
    manager_brand = DataManager::ManagerBrand.new(brands)
    response = manager_brand.list_brands_with_avarage_prices

    return render json: response[:data] if response[:status]

    render json: response, status: :internal_server_error
  end
end
