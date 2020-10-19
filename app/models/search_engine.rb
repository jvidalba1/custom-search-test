class SearchEngine
  include ActiveModel::Validations

  attr_accessor :engine, :text

  ENGINES = ['google', 'bing', 'both']

  validates :engine, :presence => true, :inclusion => { :in => ENGINES }
  validates_presence_of :text

  def initialize(engine, text)
    @engine = engine
    @text = text
  end

  def results
    generate_items
  end

  private

  def generate_items
    if(@engine == 'both')
      both_results
    else
      engine = engine_mapped.constantize.new(@text)
      parse_results(engine.results, @engine)
    end
  end

  def engine_mapped
    "Engines::#{@engine.capitalize}"
  end

  def both_results
    google_items_data = Engines::Google.new(@text).results
    # bing_items_data = Engines::Bing.new(@text).results
    google_items = parse_results(google_items_data, 'google')
    # bing_items = parse_results(bing_items_data, 'bing')

    google_items #+ bing_items
  end

  def parse_results(items_data, engine)
    items_data.map do |item_data|
      create_item(item_data, engine)
    end
  end

  def create_item(item_data, engine)
    Item.new(item_data['title'], item_data['title'], item_data['snippet'], engine.capitalize)
  end
end
