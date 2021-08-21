# frozen_string_literal: true

require_relative "lib/bit_converter/version"

Gem::Specification.new do |spec|
  spec.name          = "bit_converter"
  spec.version       = BitConverter::VERSION
  spec.authors       = ["Tuan Nguyen"]
  spec.email         = ["hi@tuanguyen.com"]

  spec.summary       = "Crypto and fiat currencies converter"
  spec.description   = "A simple crypto and fiat currency converter "\
                       "which can also serve as a minimal portfolio tracker."
  spec.homepage      = "https://github.com/tuang3142/bit-converter"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"
  spec.add_dependency "thor"
  spec.add_dependency "money", "~> 6.16"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "webmock", "~> 3.14"
  spec.add_development_dependency "byebug", "~> 11.1", ">= 11.1.3"
end
