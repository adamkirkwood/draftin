require 'faraday_middleware'

module Draftin
  module Connection
    private
    
    def connection(options={})
      options = options.merge(options)
      
      connection = Faraday.new(options) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Logger
        builder.use FaradayMiddleware::ParseJson
        builder.use Faraday::Adapter::NetHttp
      end
      
      if authenticated?
        connection.basic_auth authentication[:email], authentication[:password]
      end
      
      connection.headers[:user_agent] = "Draftin Ruby Gem #{Draftin::VERSION}".freeze
      
      connection
    end
  end
end