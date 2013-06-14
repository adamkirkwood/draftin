module Draftin
  class Client
    module Documents
      
      def all_documents
        connection = Faraday::Connection.new(:url => "https://draftin.com/api/v1") do |builder|
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::Logger
          builder.use FaradayMiddleware::ParseJson
          builder.use Faraday::Adapter::NetHttp
        end

        connection.basic_auth Draftin.options[:email], Draftin.options[:password]
        response = connection.get "/documents.json"

        response
      end
      
    end
  end
end