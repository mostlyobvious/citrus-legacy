# -*- encoding: utf-8 -*-
require File.expand_path('../lib/citrus/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Paweł Pacana"]
  gem.email         = ["pawel.pacana@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "citrus"
  gem.require_paths = ["lib"]
  gem.version       = Citrus::VERSION

  gem.add_dependency 'webmachine'
  gem.add_dependency 'celluloid-zmq'
  gem.add_dependency 'datamapper'
  gem.add_dependency 'cocaine'
  gem.add_dependency 'posix-spawn'
  gem.add_dependency 'thor'
  gem.add_dependency 'httpclient'

  # XXX: gem.add_development_dependency 'webmachine-test'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'capybara-webkit-remote'
end
