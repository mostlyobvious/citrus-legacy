#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new('test:unit') do |t|
  t.pattern = 'test/unit/*_test.rb'
  t.libs    = %w(test lib)
end

Rake::TestTask.new('test:integration') do |t|
  t.pattern = 'test/integration/*_test.rb'
  t.libs    = %w(test lib)
end

task :prepare do
  `git submodule init`
  `git submodule update`
end

task test: %w(test:unit test:integration)
task default: :test
