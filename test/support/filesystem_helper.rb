module FilesystemHelper
  def with_citrus_root(&block)
    clear_paths_depending_on_root

    Dir.mktmpdir do |new_root|
      Citrus.stubs(:root).returns(Pathname.new(new_root))
      block.call(new_root)
    end
  end

  def clear_paths_depending_on_root
    Citrus.cache_root = nil
    Citrus.build_root = nil
  end
end
