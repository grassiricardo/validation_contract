class ValidationContract

  def initialize
    @errors = []
  end

  def is_required value, message
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

  def is_fixed_len value, len, message
    if value.length() != len
      @errors.push({message: message})
    end
  end

  def is_email value, message
    if !value.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
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
