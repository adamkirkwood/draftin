require 'multi_json'

module Draftin
  module Request
    
    def get(path, options={})
      response = request(:get, path, options)
      body = response.body
      
      body
    end
    
    def request(method, path, options)
      connection_options = {
        :url => Configuration::DEFAULT_API_ENDPOINT
      }
      
      response = connection(connection_options).send(method) do |request|
        request.url(path, options)        
      end
      
      response
    end
    
  end
end