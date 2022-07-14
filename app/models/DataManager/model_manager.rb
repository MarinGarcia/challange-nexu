module DataManager
  class ModelManager
    MINIMUM_AMOUNT = 100000.freeze

    private_constant :MINIMUM_AMOUNT

    def initialize()
    end

    def self.create_register(brand_id, params)
      params = JSON.parse(params).with_indifferent_access
      raise StandardError, 'Model already exists' if Model.find_by_name(params[:name])

      params.merge!('brand_id': brand_id)
      new_model = Model.create(params)
      return { data: new_model, status: true } if new_model

      raise StandardError, 'Failed to save record'
    rescue => e
      { data: [], status: false, message: e.message }
    end

    def self.update_register(model_id, params)
      params = JSON.parse(params).with_indifferent_access
      average_price = params[:average_price].to_i
      raise StandardError, 'Must be greater then 100,000' if average_price <= MINIMUM_AMOUNT

      model = Model.find(model_id)
      raise StandardError, 'Register to update does not exist' unless model

      model.average_price = average_price
      return { data: model, status: true } if model.save!

      raise StandardError, 'Internal Error'
    rescue => e
      { data: [], status: false, message: e.message }
    end

    def self.list_with_range_price(greater, lower)
      models = Model.select(:id, :name, :average_price)
                    .where( average_price: greater..lower)

      { data: models, status: true }
    rescue => e
      { data: [], status: false, message: e.message }
    end
  end
end
