class ModelsController < ApplicationController

  def create
    parameters = model_params_new
    brand_id = id_param
    model_manager = DataManager::ModelManager
    response = model_manager.create_register(brand_id, parameters.to_json)
    build_response(response)
  end

  def update
    parameters = model_params_new
    model_id = id_param
    model_manager = DataManager::ModelManager
    response = model_manager.update_register(model_id, parameters.to_json)
    build_response(response)
  end

  def show
    params = search_params
    model_manager = DataManager::ModelManager
    response = model_manager.list_with_range_price(params[:greater], params[:lower])
    build_response(response)
  end

  private

  def model_params_new
    params.require(:model).permit(:name, :average_price)
  end

  def id_param
    params.permit(:id)['id']
  end

  def search_params
    greater = params.permit![:greater] || 0
    lower = params.permit![:lower] || 0
    { greater: greater, lower: lower }
  end

  def build_response(response)
    return render json: response[:data] if response[:status]

    render json: response, status: :internal_server_error
  end
end