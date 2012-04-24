require 'test_helper'
require 'citrus/repository'

class RepositoryTest < UnitTestCase
  def test_can_clone_source_repository_to_destination
    Dir.mktmpdir do |tmp|
      repo = Citrus::Repository.new(valid_repository_url)
      repo.clone(tmp)
      assert_git_repository tmp
    end
  end
end
