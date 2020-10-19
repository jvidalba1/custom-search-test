module Engines
  class Base
    attr_accessor :text

    def initialize(text)
      @text = text
    end
  end
end