require 'citrus'

module Citrus
  class Entity
    include ActiveModel::Validations
    include Virtus
  end
end
