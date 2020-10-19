class SearchingError < StandardError
  attr_accessor :error

  def initialize(error)
    super(error)
  end
end