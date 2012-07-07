module RepositoryAssertions
  def assert_git_repository(path, msg = nil)
    msg = message(msg) {
      "Expected #{mu_pp(path)} to be git repository"
    }
    git_path = File.join(path.to_s, '.git')
    assert File.directory?(git_path), msg
  end

  def assert_git_revision(path, rev, msg = nil)
    msg = message(msg) {
      "Expected #{mu_pp(path)} to be git repository in revision #{mu_pp(rev)}"
    }
    sha = `cd '#{path}' && git log --max-count=1 --pretty=format:%H`
    assert_equal sha, rev, msg

  end

  def assert_git_branch(path, branch, msg = nil)
    msg = message(msg) {
      "Expected #{mu_pp(path)} to be git repository in branch #{mu_pp(branch)}"
    }
    refs = `cd '#{path}' && git log --max-count=1 --pretty=format:%d`
    assert_match /#{branch}/, refs, msg
  end
end
