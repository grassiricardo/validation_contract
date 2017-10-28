require 'validation_contract/version'
require 'uri'

module ValidationContract
  class Validations
    def initialize
      @errors = []
    end

    def required(value, message)
      return @errors.push(message: message) if !value || value.length <= 0
    end

    def has_min_len(value, min, message)
      return @errors.push(message: message) if !value || value.length < min
    end

    def has_max_len(value, max, message)
      return @errors.push(message: message) if !value || value.length > max
    end

    def fixed_len(value, len, message)
      return @errors.push(message: message) if value.length != len
    end

    def email(value, message)
      unless value.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
        @errors.push(message: message)
      end
    end

    def greater_than(value, comparer, message)
      return @errors.push(message: message) if value <= comparer
    end

    def lower_than(value, comparer, message)
      return @errors.push(message: message) if value >= comparer
    end

    def url(value, message)
      unless value.match(URI.regexp)
        @errors.push(message: message)
      end
    end

    def erros
      @errors
    end

    def clear
      @errors = []
    end

    def is_valid
      @errors.length.zero?
    end
  end
end
