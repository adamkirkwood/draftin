require 'faraday'
require 'draftin/version'

module Draftin
  module Configuration
    VALID_OPTIONS_KEYS = [
      :email,
      :password].freeze
    
    DEFAULT_API_VERSION   = "v1"
    DEFAULT_API_ENDPOINT  = "https://draftin.com/api/#{DEFAULT_API_VERSION}/"
    
    attr_accessor(*VALID_OPTIONS_KEYS)
        
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end
    
    def reset
      self.email    = nil
      self.password = nil
    end
  end
end