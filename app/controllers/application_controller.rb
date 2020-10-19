class ApplicationController < ActionController::API
  rescue_from SearchEngineError, with: :search_engine_error
  rescue_from SearchingError, with: :searching_error

  protected

  def prepare_response(items)
    render status: 200, json: response_shape(items)
  end

  def search_engine_error(error)
    render status: :unprocessable_entity, json: {
      message: "Error in parameters, please review.",
      errors: error.errors
    }
  end

  def searching_error(message)
    render status: 500, json: {
      message: message
    }
  end

  private

  def response_shape(items)
    {
      items: mapped_items(items)
    }
  end

  def mapped_items(items)
    items.map do |item|
      item.to_json
    end
  end
end
