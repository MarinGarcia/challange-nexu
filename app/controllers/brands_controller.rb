class BrandsController < ApplicationController
  def index
    brands = Brand.all.select(:id, :name)
    manager_brand = DataManager::BrandManager
    response = manager_brand.list_with_avarage_prices(brands)
    build_response(response)
  end

  def show
    brand_id = brand_params_list
    manager_brand = DataManager::BrandManager
    response = manager_brand.list_models(brand_id)
    build_response(response)
  end

  def create
    parameters = brand_params_new
    manager_brand = DataManager::BrandManager
    response = manager_brand.create_register(parameters.to_json)
    build_response(response)
  end

  private

  def brand_params_list
    params.permit(:id)['id']
  end

  def brand_params_new
    params.require(:brand).permit(:name)
  end

  def build_response(response)
    return render json: response[:data] if response[:status]

    render json: response, status: :internal_server_error
  end
end
