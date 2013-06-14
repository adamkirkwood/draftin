require 'draftin/authentication'
require 'draftin/connection'
require 'draftin/request'

require 'draftin/client/documents'

module Draftin
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
    
    def initialize(options={})
      options = Draftin.options.merge(options)
      
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    include Draftin::Authentication
    include Draftin::Connection
    include Draftin::Request
    
    include Draftin::Client::Documents
  end
end