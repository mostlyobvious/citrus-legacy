source 'https://rubygems.org'

gemspec
gem 'webmachine',    git: 'git://github.com/seancribbs/webmachine-ruby.git', branch: 'reel'
gem 'reel',          git: 'git://github.com/celluloid/reel.git'

group :test do
  gem 'webmachine-test', git: 'git://github.com/bernd/webmachine-test.git'
  gem 'guard-minitest'

  if RUBY_PLATFORM =~ /darwin/
    gem 'growl'
    gem 'rb-fsevent'
  end
end
