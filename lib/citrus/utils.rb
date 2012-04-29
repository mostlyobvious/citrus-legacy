require 'digest/sha1'

module Citrus
  module Utils
    extend self

    def name_from_url(repository_url)
      Digest::SHA1.hexdigest(repository_url)
    end
  end
end
