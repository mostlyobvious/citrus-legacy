module Assertions
  def assert_git_repository(path, msg = nil)
    msg = message(msg) {
      "Expected #{mu_pp(path)} to be git repository"
    }
    git_path = File.join(path.to_s, '.git')
    assert File.directory?(git_path), msg
  end

  def assert_directory(path, msg = nil)
    msg = message(msg) {
      "Expected #{mu_pp(path)} to be directory"
    }
    assert File.directory?(path), msg
  end
end
