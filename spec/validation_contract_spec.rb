require "spec_helper"

RSpec.describe ValidationContract do
  it "has a version number" do
    expect(ValidationContract::VERSION).not_to be nil
  end

  it "is instantiated?" do
    @validation_contract = ValidationContract::Validations.new
    expect(@validation_contract).not_to be nil
  end

  describe "this array errors is instantiated?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "is initialize?" do
      expect(@validation_contract.erros).not_to be nil
    end
  end

  describe "this value is required?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "is required" do
      @validation_contract.required('', 'Value is required')
      expect(@validation_contract.erros).not_to be nil
    end

    it "not is required" do
      @validation_contract.required('teste required', 'Value is required')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this value has min length?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "not has min length" do
      @validation_contract.has_min_len('value', 6, 'Value has min length')
      expect(@validation_contract.erros[0][:message]).to eql('Value has min length')
    end

    it "has min length equals length" do
      @validation_contract.has_min_len('value', 5, 'Value has min length')
      expect(@validation_contract.erros).to eq([])
    end

    it "has min length not equals length" do
      @validation_contract.has_min_len('value', 3, 'Value has min length')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this value has max length?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "not has max length" do
      @validation_contract.has_max_len('value', 3, 'Value has max length')
      expect(@validation_contract.erros[0][:message]).to eql('Value has max length')
    end

    it "has max length equals length" do
      @validation_contract.has_max_len('value', 5, 'Value has max length')
      expect(@validation_contract.erros).to eq([])
    end

    it "has max length not equals length" do
      @validation_contract.has_max_len('value', 6, 'Value has max length')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this value has fixed length?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "not has fixed length" do
      @validation_contract.fixed_len('value', 6 , 'Value has fixed length 5')
      expect(@validation_contract.erros[0][:message]).to eql('Value has fixed length 5')
    end

    it "has fixed length" do
      @validation_contract.is_fixed_len('value', 5, 'Value has max length')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this value is email valid?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "this email not valid" do
      @validation_contract.email('test@test','This email is not valid')
      expect(@validation_contract.erros[0][:message]).to eql('This email is not valid')
    end

    it "not has fixed length" do
      @validation_contract.email('test@test.com','This email is not valid')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this value is greater than?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "this value is not greater than" do
      @validation_contract.greater_than(1, 2,'The value should be greater than 2')
      expect(@validation_contract.erros[0][:message]).to eql('The value should be greater than 2')
    end

    it "this value is equal than" do
      @validation_contract.greater_than(2, 2,'The value should be greater than 2')
      expect(@validation_contract.erros[0][:message]).to eql('The value should be greater than 2')
    end

    it "this value is greater than" do
      @validation_contract.greater_than(3, 2,'The value should be greater than 2')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this value is lower than?" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "this value is not lower than" do
      @validation_contract.lower_than(3, 2,'The value should be lower than 2')
      expect(@validation_contract.erros[0][:message]).to eql('The value should be lower than 2')
    end

    it "this value is equal than" do
      @validation_contract.lower_than(2, 2,'The value should be lower than 2')
      expect(@validation_contract.erros[0][:message]).to eql('The value should be lower than 2')
    end

    it "this value is lower than" do
      @validation_contract.lower_than(1, 2,'The value should be lower than 2')
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this return errors" do
    before do
      @validation_contract = ValidationContract::Validations.new
    end

    it "this two erros is return 2 errors" do
      @validation_contract.email('test@test','This email is not valid')
      @validation_contract.has_max_len('value', 3, 'Value has max length')
      expect(@validation_contract.erros.count).to eq(2)
      expect(@validation_contract.erros[0][:message]).to eql('This email is not valid')
      expect(@validation_contract.erros[1][:message]).to eql('Value has max length')
    end

    it "this not erros is return is []" do
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this clear errors" do
    before do
      @validation_contract = ValidationContract::Validations.new
      @validation_contract.email('test@test','This email is not valid')
      @validation_contract.has_max_len('value', 3, 'Value has max length')
    end

    it "this two erros is return 2 errors" do
      expect(@validation_contract.erros.count).to eq(2)
      expect(@validation_contract.erros[0][:message]).to eql('This email is not valid')
      expect(@validation_contract.erros[1][:message]).to eql('Value has max length')
    end

    it "this clear errors" do
      @validation_contract.clear
      expect(@validation_contract.erros).to eq([])
    end
  end

  describe "this validations is valid" do
    before do
      @validation_contract = ValidationContract::Validations.new
      @validation_contract.email('test@test','This email is not valid')
      @validation_contract.has_max_len('value', 3, 'Value has max length')
    end

    it "this array valid is not valid" do
      expect(@validation_contract.is_valid).to eq(false)
    end

    it "this array is valid" do
      @validation_contract.clear
      expect(@validation_contract.is_valid).to eq(true)
    end
  end

end
