class SearchsController < ApplicationController
  def search
    result = Wrappers::Search.new(search_params).execute
  end

  private

  def search_params
    params.require(:search).permit(:engine, :text)
  end
end
