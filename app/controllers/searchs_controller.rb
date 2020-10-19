class SearchsController < ApplicationController
  def search
    items = SearchWrapper.new(search_params).execute
    prepare_response(items)
  end

  private

  def search_params
    params.require(:search).permit(:engine, :text)
  end
end
