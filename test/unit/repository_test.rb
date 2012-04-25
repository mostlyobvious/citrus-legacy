require 'test_helper'
require 'citrus/repository'

class RepositoryTest < UnitTestCase
  def test_should_checkout_remote_repository
    Dir.mktmpdir do |tmpdir|
      repo = Citrus::Repository.new(valid_repository_url)
      repo.checkout(tmpdir)
      assert_git_repository tmpdir
    end
  end

  def test_should_checkout_correct_revision
    Dir.mktmpdir do |tmpdir|
      repo = Citrus::Repository.new(valid_repository_url)
      rev  = 'bb62bf8a1390c4cb0ac0c6a80f3450faf5e125e9'
      repo.checkout(tmpdir, rev)
      assert_git_revision tmpdir, rev
    end
  end

  def test_should_checkout_to_named_branch
    Dir.mktmpdir do |tmpdir|
      repo = Citrus::Repository.new(valid_repository_url)
      branch = 'build'
      rev    = 'bb62bf8a1390c4cb0ac0c6a80f3450faf5e125e9'
      repo.checkout(tmpdir, rev)
      assert_git_branch tmpdir, branch
    end
  end
end
