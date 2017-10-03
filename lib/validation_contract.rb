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

  # def is_email value, message
  #   reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
  #   if !value.match?('[a-z0-9]+[_a-z0-9\.-]*[a-z0-9]+@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})')
  #     @errors.push({message: message})
  #   end
  # end

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
