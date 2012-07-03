ENV['CITRUS_ENV'] = 'test'

gem 'minitest'
require 'webrick'
require 'minitest/autorun'
require 'mocha'

Dir[File.expand_path(File.join(__FILE__, '../support/*.rb'))].each { |m| require m }

