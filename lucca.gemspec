# frozen_string_literal: true

require_relative 'lib/lucca/version'

Gem::Specification.new do |spec|
  spec.name          = 'lucca'
  spec.version       = Lucca::VERSION
  spec.authors       = ['Gueorgui Tcherednitchenko']
  spec.email         = ['gt@gueorgui.net']

  spec.summary       = 'A modular CLI time tracking tool'
  spec.description   = 'A modular CLI time tracking tool'
  spec.homepage      = 'https://github.com/gueorgui/lucca'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage + '/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|images)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.add_dependency 'thor', '~> 1.0.1'

  spec.add_development_dependency 'awesome_print', '~> 1.8.0'
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'coveralls', '~> 0.8.23'
  spec.add_development_dependency 'factory_bot', '~> 5.1.1'
  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.80.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'
end
