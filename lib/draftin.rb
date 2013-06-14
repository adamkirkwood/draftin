require 'draftin/version'
require 'faraday'
require 'faraday_middleware'

require 'draftin/configuration'
require 'draftin/client'

module Draftin
  extend Configuration
  
  class << self
    
    def new(options={})
      Draftin::Client.new(options)
    end
    
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
    
  end
end
