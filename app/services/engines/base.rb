module Engines
  class Base
    attr_accessor :text

    def initialize(text)
      @text = text
    end
  end
end

key = "c075004555c84229987e2c14c6956e5f"
r = HTTParty.get("https://customsearchtest1991.cognitiveservices.azure.com/bing/v7.0/search?q=medellin", headers: { 'Ocp-Apim-Subscription-Key' => key}, verify: true)

accessKey = key
uri  = "https://customsearchtest1991.cognitiveservices.azure.com/"
path = "/bing/v7.0/search"
term = "Microsoft Cognitive Services"

uri = URI(uri + path + "?q=" + URI.escape(term))

request = Net::HTTP::Get.new(uri)
request['Ocp-Apim-Subscription-Key'] = accessKey

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
  http.request(request)
end