lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegrammer/version'

Gem::Specification.new do |spec|
  spec.name          = "telegrammer"
  spec.version       = Telegrammer::VERSION
  spec.authors       = ["Luis Mayoral"]
  spec.email         = ["luis@luismayoral.com"]
  spec.description   = %q{Ruby client for the Telegram's Bots API}
  spec.summary       = %q{Ruby client for the Telegram's Bots API}
  spec.homepage      = "https://github.com/mayoral/telegrammer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.7"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "multi_json", "~> 1.11"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.1"
end
