require 'faraday_middleware'

module Draftin
  module Connection
    private
    
    def connection(options={})
      options = options.merge(options)
      
      connection = Faraday.new(options) do |builder|
        builder.request :url_encoded
        
        builder.response :json, :content_type => /\bjson$/
        builder.response :mashify
        builder.response :logger
        
        builder.adapter :net_http
        
      end
      
      if authenticated?
        connection.basic_auth authentication[:email], authentication[:password]
      end
      
      connection.headers[:user_agent] = "Draftin Ruby Gem #{Draftin::VERSION}".freeze
      
      connection
    end
  end
end