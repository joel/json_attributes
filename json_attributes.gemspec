require_relative 'lib/json_attributes/version'

Gem::Specification.new do |spec|
  spec.name          = 'json_attributes'
  spec.version       = JsonAttributes::VERSION
  spec.authors       = ['Joel AZEMAR']
  spec.email         = ['joel.azemar@gmail.com']

  spec.summary       = %q{Allow to use postgres json field in a totally transparently manner}
  spec.description   = %q{Allow to use postgres json field in a totally transparently manner with ActiveRecord}
  spec.homepage      = 'https://github.com/joel/json_attributes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord',  '~> 4.2'
  spec.add_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec'
end
