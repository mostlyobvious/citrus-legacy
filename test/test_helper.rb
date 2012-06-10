ENV['CITRUS_ENV'] = 'test'

gem 'minitest'
require 'minitest/autorun'
require 'mocha'

Dir[File.expand_path(File.join(__FILE__, '../support/*.rb'))].each { |m| require m }

# silence reel and zmq actors
Celluloid.logger = nil

