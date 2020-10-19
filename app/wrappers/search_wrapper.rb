class SearchWrapper
  attr_accessor :engine, :text

  def initialize(search_params)
    @engine, @text = map_search_params(search_params)
  end

  def execute
    search_engine = SearchEngine.new(@engine, @text)

    if search_engine.valid?
      search_engine.results
    else
      raise SearchEngineError.new(search_engine.errors)
    end
  end

  private

  def map_search_params(params)
    [params[:engine], params[:text]]
  end
end