require 'draftin/client/documents'

module Draftin
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
    
    def initialize(options={})
      options = Draftin.options.merge(options)
      
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        Draftin.send("#{key}=", options[key])
      end
    end
    
    include Draftin::Client::Documents
  end
end