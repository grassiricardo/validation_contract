# ValidationContract
[![Gem Version](https://badge.fury.io/rb/validation_contract.svg)](https://rubygems.org/gems/validation_contract)
![ruby](https://img.shields.io/badge/Ruby-2.4.2-green.svg)
[![Build Status](https://travis-ci.org/grassiricardo/validation_contract.svg?branch=master)](https://travis-ci.org/grassiricardo/validation_contract)
[![Build Status](https://app.codeship.com/projects/97a495a0-8bf9-0135-191d-3e39845176c6/status?branch=master)](https://app.codeship.com/projects/97a495a0-8bf9-0135-191d-3e39845176c6)
[![Maintainability](https://api.codeclimate.com/v1/badges/a9099988656b3a478a93/maintainability)](https://codeclimate.com/github/grassiricardo/validation_contract/maintainability)
[![Dependency Status](https://gemnasium.com/badges/github.com/grassiricardo/validation_contract.svg)](https://gemnasium.com/github.com/grassiricardo/validation_contract)

This gem and its validations have been implemented on top of the ```Notification Pattern```, which allows API to return all the validations at a single time, improving the user experience.

Validations of the day day for your rails project.

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

| Validation      | Example                                             | Done  |
| -------------   |:---------------------------------------------------:| -----:|
| required        | validate if field is required                       |   V   |
| has_min_len     | check if the field has a minimum of characters      |   V   |
| has_max_len     | checks if the field has a maximum of characters     |   V   |
| fixed_len       | checks if there is an x quantity of                 |   V   |
| email           | check if email is valid                             |   V   |
| greater_than    | valid if one number is greater than another         |   V   |
| lower_than      | valid if one number is smaller than another         |   V   |
| errors          | Return errors                                       |   V   |
| clear           | Clears the arry error                               |   V   |
| valid           | Check whether this arry is valid or not             |   V   |
| url             | check if url is valid                               |   V   |

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Contributor

[Ricardo Grassi](https://github.com/grassiricardo).

[Alan Lira](https://github.com/lira92).

## License

ValidationContract is released under the [MIT License](http://www.opensource.org/licenses/MIT).
