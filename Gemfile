source 'https://rubygems.org'

gemspec
gem 'webmachine',    git: 'git://github.com/pawelpacana/webmachine-ruby.git', branch: 'mongrel2-adapter'
gem 'm2r',           git: 'git://github.com/pawelpacana/m2r.git'
gem 'celluloid-zmq', git: 'git://github.com/celluloid/celluloid-zmq.git'
gem 'bbq',           git: 'git://github.com/drugpl/bbq.git'

group :test do
  gem 'webmachine-test', git: 'git://github.com/bernd/webmachine-test.git'
  gem 'guard-minitest'
end

group :darwin do
  gem 'growl'
  gem 'rb-fsevent'
end

