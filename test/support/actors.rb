require 'bbq/test_user'
require 'citrus/cli'

class TestUser < Bbq::TestUser
  include MiniTest::Assertions

  def add_project_from_cmdline(name, repo)
    Citrus::CLI.new.add(name)
  end

  def visit_projects
    visit '/projects'
  end

  def see!(*args)
    args.each do |arg|
      assert has_content?(arg), %Q/Expected to see "#{arg}" but not found./
    end
  end
end

class TestGithub
  def expecting_hook_configuration(repo, &block)
    block.call
  end
end
