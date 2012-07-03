require 'test_helper'

class UserAddsProjectToContinousIntegrationTest < AcceptanceTestCase
  def test_user_can_add_github_project
    repo  = 'git://github.com/pawelpacana/citrus.git'
    name  = 'citrus'

    @user.add_project_from_cmdline(name, repo)
    @user.visit_projects
    @user.see! name
  end
end
