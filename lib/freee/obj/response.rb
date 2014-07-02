module Freee::Response
  class Base
    attr_reader :val

    def initialize(val)
      @val = Hash.try_convert(val)
    end

    def method_missing(name, *args)
      @val[name.to_s]
    end

    def [](name)
      @val[name.to_s]
    end

    def has_key?(name)
      if @val[name.to_s]
        return true
      else
        return false
      end
    end
    alias_method :key, :has_key?
    alias_method :include?, :has_key?
    alias_method :member?, :has_key?
  end
end
