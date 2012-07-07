#!/usr/bin/env rake
require 'rake/testtask'

Rake::TestTask.new('test:unit') do |t|
  t.pattern = 'test/unit/*_test.rb'
  t.libs    = %w(test lib)
end

Rake::TestTask.new('test:integration') do |t|
  t.pattern = 'test/integration/*_test.rb'
  t.libs    = %w(test lib)
end

Rake::TestTask.new('test:acceptance') do |t|
  t.pattern = 'test/acceptance/*_test.rb'
  t.libs    = %w(test lib)
end

task test: %w(test:unit test:integration test:acceptance)
task default: :test
