class Item
  attr_accessor :title, :link, :description, :engine

  def initialize(title, link, description, engine)
    @title = title
    @link = link
    @description = description
    @engine = engine
  end

  def to_json
    {
      title: self.title,
      link: self.link,
      description: self.description,
      engine: self.engine
    }
  end
end