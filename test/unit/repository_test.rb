require 'test_helper'
require 'citrus/repository'

class RepositoryTest < UnitTestCase
  include FilesystemHelper
  include RepositoryAssertions

  def setup
    @repository = Citrus::Repository.new(valid_repository_path)
  end

  def test_should_checkout_remote_repository
    with_citrus_root do |root|
      tmpdir = File.join(root, 'test_repo')
      @repository.checkout(tmpdir)
      assert_git_repository tmpdir
    end
  end

  def test_should_checkout_correct_revision
    with_citrus_root do |root|
      tmpdir = File.join(root, 'test_repo')
      rev  = 'bb62bf8a1390c4cb0ac0c6a80f3450faf5e125e9'
      @repository.checkout(tmpdir, rev)
      assert_git_revision tmpdir, rev
    end
  end

  def test_should_checkout_to_named_branch
    with_citrus_root do |root|
      tmpdir = File.join(root, 'test_repo')
      branch = 'build'
      rev    = 'bb62bf8a1390c4cb0ac0c6a80f3450faf5e125e9'
      @repository.checkout(tmpdir, rev)
      assert_git_branch tmpdir, branch
    end
  end
end
