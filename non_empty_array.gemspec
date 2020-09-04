# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'non_empty_array'
  spec.version       = '1.1.0'
  spec.authors       = ['Robb Shecter']
  spec.email         = ['robb@public.law']

  spec.summary       = 'An ordered list guaranteed to have at least one element.'
  spec.description   = "Inspired by Haskell's NonEmpty list"
  spec.homepage      = 'https://github.com/dogweather/non_empty_array'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dogweather/non_empty_array'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'sorbet', '>= 0.5.5890'

  spec.add_runtime_dependency 'sorbet-runtime', '>= 0.5.5890'
end
