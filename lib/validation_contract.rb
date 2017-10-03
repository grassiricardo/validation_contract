require "validation_contract/version"

module ValidationContract
  errors = []

  def is_required value, message
    if !value || value.length() <= 0
      erros.push({message: message})
    end
  end
end
