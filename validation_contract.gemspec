# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "validation_contract/version"

Gem::Specification.new do |spec|
  spec.name          = "validation_contract"
  spec.version       = ValidationContract::VERSION
  spec.authors       = ["grassiricardo"]
  spec.email         = ["grassiricardorg@gmail.com"]

  spec.summary       = %q{Validations of the day day for your rails project.}
  spec.description   = %q{With this gem you will have several validations that are common on day day and that will make life much easier for dev. Validations can be returned in a simple and standardized way..}
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
