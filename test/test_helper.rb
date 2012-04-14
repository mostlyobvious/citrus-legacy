gem 'minitest'
require 'minitest/autorun'

Dir[File.expand_path(File.join(__FILE__, '../../lib/*.rb'))].each do |m|
  require m
end
