module Filesystem
  def with_citrus_root(&block)
    Dir.mktmpdir do |root|
      Citrus.stubs(:root).returns(Pathname.new(root))
      block.call(root)
    end
  end
end
