class SearchEngineError < StandardError
  attr_accessor :errors

  def initialize(errors)
    @errors = errors.messages
    super
  end
end