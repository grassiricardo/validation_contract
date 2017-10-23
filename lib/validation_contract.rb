require "validation_contract/version"

module ValidationContract
  class Validations

    def initialize
      @errors = []
    end

    def required value, message
      if !value || value.length() <= 0
        @errors.push({message: message})
      end
    end

    def has_min_len value, min, message
      if !value || value.length() < min
        @errors.push({message: message})
      end
    end

    def has_max_len value, max, message
      if !value || value.length() > max
        @errors.push({message: message})
      end
    end

    def fixed_len value, len, message
      if value.length() != len
        @errors.push({message: message})
      end
    end

    def email value, message
      if !value.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
        @errors.push({message: message})
      end
    end

    def greater_than value, comparer, message
      if value <= comparer
        @errors.push({message: message})
      end
    end

    def lower_than value, comparer, message
      if value >= comparer
        @errors.push({message: message})
      end
    end

    def erros
      return @errors
    end

    def clear
      return @errors = []
    end

    def is_valid
      return @errors.length == 0
    end

  end
end
