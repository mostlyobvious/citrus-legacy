source 'https://rubygems.org'

gemspec

group :test do
  gem 'webmachine-test', git: 'git://github.com/bernd/webmachine-test.git'
  gem 'guard-minitest'

  if RUBY_PLATFORM =~ /darwin/
    gem 'growl'
    gem 'rb-fsevent'
  end
end
