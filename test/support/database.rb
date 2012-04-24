require 'data_mapper'
DataMapper.setup(:default, 'in_memory::')

module Database
  def teardown
    DataMapper.repository(:default).adapter.reset
  end
end
