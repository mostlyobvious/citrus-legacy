gem 'minitest'
require 'minitest/autorun'
require 'webmachine/test'
require 'mocha'

Dir[File.expand_path(File.join(__FILE__, '../support/*.rb'))].each { |m| require m }


