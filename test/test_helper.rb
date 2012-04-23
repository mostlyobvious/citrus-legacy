gem 'minitest'
require 'minitest/autorun'
require 'data_mapper'
require 'webmachine/test'
require 'mocha'
require 'fakefs/safe'

DataMapper.setup(:default, 'in_memory::')

Dir[File.expand_path(File.join(__FILE__, '../../lib/*.rb'))].each do |m|
  require m
end

module Fixtures
  def valid_hook_data
    <<-END
      {
        "after": "560e1628dbb2012ae9a46f80b39a8580e21eb386",
        "before": "560e1628dbb2012ae9a46f80b39a8580e21eb386",
        "commits": [],
        "compare": "https://github.com/pawelpacana/test-hooks/compare/560e162...560e162",
        "created": false,
        "deleted": false,
        "forced": false,
        "head_commit": {
          "added": [ "README" ],
          "author": { "email": "pawel.pacana@gmail.com", "name": "Pawe\u0142 Pacana", "username": "pawelpacana" },
          "committer": { "email": "pawel.pacana@gmail.com", "name": "Pawe\u0142 Pacana", "username": "pawelpacana" },
          "distinct": false,
          "id": "560e1628dbb2012ae9a46f80b39a8580e21eb386",
          "message": "initial commit",
          "modified": [],
          "removed": [],
          "timestamp": "2012-04-14T15:34:07-07:00",
          "url": "https://github.com/pawelpacana/test-hooks/commit/560e1628dbb2012ae9a46f80b39a8580e21eb386"
        },
        "pusher": { "name": "none" },
        "ref": "refs/heads/master",
        "repository": {
          "created_at": "2012/04/14 15:33:10 -0700",
          "description": "",
          "fork": false,
          "forks": 1,
          "has_downloads": true,
          "has_issues": true,
          "has_wiki": true,
          "homepage": "",
          "name": "test-hooks",
          "open_issues": 0,
          "owner": { "email": "pawel.pacana@gmail.com", "name": "pawelpacana" },
          "private": false,
          "pushed_at": "2012/04/14 15:34:33 -0700",
          "size": 92,
          "url": "https://github.com/pawelpacana/test-hooks",
          "watchers": 1
        }
      }
    END
  end
end

module InMemoryStore
  def teardown
    DataMapper.repository(:default).adapter.reset
  end
end

class UnitTestCase < MiniTest::Unit::TestCase
  include InMemoryStore
  include Fixtures
end

class WebmachineTestCase < MiniTest::Unit::TestCase
  include InMemoryStore
  include Fixtures
  include Webmachine::Test

  def app
    Application.new.webmachine
  end
end
