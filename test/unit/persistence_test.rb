require 'test_helper'
require 'citrus/persistence'

class PersistenceTest < UnitTestCase
  def setup
    @db = Citrus::Persistence.new
  end

  def test_storing_object_by_key
    project = valid_project
    @db[project.class].save(project.name, project)
    assert_equal 1, @db[project.class].count
  end

  def test_getting_object_by_key
    project = valid_project
    @db[project.class].save(project.name, project)

    assert_equal project, @db[project.class].find(project.name)
  end

  def test_getting_all_objects
    project = valid_project
    @db[project.class].save(project.name, project)

    assert_equal [project], @db[project.class].all
  end
end
