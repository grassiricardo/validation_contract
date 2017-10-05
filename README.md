# ValidationContract

Validations of the day day for your rails project

With this gem you will have several validations that are common on day day and that will make life much easier for dev. Validations can be returned in a simple and standardized way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validation_contract'
```

And then execute:

    bundle

Or install it yourself as:

    gem install validation_contract

## Usage

    require 'validation_contract'

    validation_contract = ValidationContract.new

Verifying an invalid email, the return will be an array with message and its validation inside, this will occur for all the desired validations.

    validation_contract.is_email('teste.com', 'This email is invalid') => "{message: 'This email is invalid'}"

By checking a valid email, nothing will be added in the return, leaving only the validations that are with incorrect values.

    validation_contract.is_email('teste@teste.com', 'This email is invalid') => "nil"

Suggestion for the validations. Perform all the necessary validations and then before executing the desired process use the following:

    if !validation_contract.is_valid
        return validation_contract.errros
    end

This will check if there is any invalid field, if there is an arry returned with all the validations. This type of validation is very good for APIs that are being used for a form with many fields, so you return to the FRONT all errors at one time.
