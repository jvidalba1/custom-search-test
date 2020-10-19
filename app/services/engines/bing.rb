module Engines
  class Bing < Base
    URL = "#{ENV['BING_API_URL']}"

    def results
      response = HTTParty.get(URL + "?q=#{@text}", headers: { 'Ocp-Apim-Subscription-Key' => ENV['BING_API_KEY']})

      if response["error"]
        raise response['error']['message']
      else
        response['items'] # This could be different in Bing response
      end
    rescue StandardError => e
      raise ::SearchingError.new(e || "Error searching text, please retry.")
    end
  end
end