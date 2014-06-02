require File.expand_path('../lib/humanhash/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "humanhash"
  gem.version       = HumanHash::VERSION
  gem.authors       = ["Jacob Carlson", "Ross Duggan"]
  gem.email         = ["ross.duggan@acm.org"]
  gem.summary       = "Human-readable digests."
  gem.description   = "humanhash provides human-readable representations of digests."
  gem.license       = "Unlicense"
  gem.homepage      = "https://github.com/duggan/humanhash-ruby"

  gem.files         = Dir.glob("{lib}/**/*") + %w(README.md)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
