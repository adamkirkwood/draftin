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
        case method
        when :get
          request.url(formatted_path(path), options)
        when :delete
          puts "Unimplemented"
        when :patch, :post, :put
          puts "Unimplemented"
        end
      end
      
      response
    end
    
    def formatted_path(path)
      [path, 'json'].compact.join('.')
    end
    
  end
end