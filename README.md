# ValidationContract
[![Gem Version](https://badge.fury.io/rb/validation_contract.svg)](https://rubygems.org/gems/validation_contract)
[![Build Status](https://app.codeship.com/projects/97a495a0-8bf9-0135-191d-3e39845176c6/status?branch=master)](https://app.codeship.com/projects/97a495a0-8bf9-0135-191d-3e39845176c6/status?branch=master)


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

    validation_contract = ValidationContract::Validations.new

Verifying an invalid email, the return will be an array with message and its validation inside, this will occur for all the desired validations.

    validation_contract.is_email('teste.com', 'This email is invalid') => "{message: 'This email is invalid'}"

By checking a valid email, nothing will be added in the return, leaving only the validations that are with incorrect values.

    validation_contract.is_email('teste@teste.com', 'This email is invalid') => "nil"

Suggestion for the validations. Perform all the necessary validations and then before executing the desired process use the following:

    if !validation_contract.is_valid
        return validation_contract.errros
    end

This will check if there is any invalid field, if there is an arry returned with all the validations. This type of validation is very good for APIs that are being used for a form with many fields, so you return to the FRONT all errors at one time.

## Validations

- is_required => 'validate if field is required'
- has_min_len => 'check if the field has a minimum of characters'
- has_max_len => 'checks if the field has a maximum of characters'
- is_fixed_len => Checks if there is an x ​​quantity of '
- is_email => 'Check if email is valid'
- errors => 'Return errors'
- clear => 'Clears the arry error'
- is_valid => 'Check whether this arry is valid or not'


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Contributor

[Ricardo Grassi](https://github.com/grassiricardo).

## License

ValidationContract is released under the [MIT License](http://www.opensource.org/licenses/MIT).
