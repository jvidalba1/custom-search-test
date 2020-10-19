module Engines
  class Google < Base
    URL = "#{ENV['GOOGLE_API_URL']}key=#{ENV['GOOGLE_API_KEY']}&cx=#{ENV['GOOGLE_API_CX']}"

    def results
      response = HTTParty.get(URL + "&q=#{@text}")

      if response["error"]
        raise response['error']['message']
      else
        response['items']
      end
    rescue StandardError => e
      raise ::SearchingError.new(e || "Error searching text, please retry.")
    end
  end
end