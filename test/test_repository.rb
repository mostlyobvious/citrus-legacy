require 'test_helper'

class RepositoryTest < UnitTestCase
  include FileSystem
  include RepositoryHelper

  def test_can_clone_source_repository_to_destination
    repo = Repository.new(valid_repository_url)
    on_filesystem do
      dest = Citrus.build_root.join('build_dir')
      repo.clone(dest)
      assert repository?(dest)
    end
  end
end
