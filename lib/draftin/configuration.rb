module Draftin
  module Configuration
    VALID_OPTIONS_KEYS = [
      :email,
      :password].freeze
    
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