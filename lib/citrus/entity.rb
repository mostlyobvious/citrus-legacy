require 'citrus'

module Citrus
  class Entity
    include Virtus

    def valid?
      return true unless self.class.required_attributes
      self.class.required_attributes.all? { |attr| !!send(attr) }
    end

    class << self
      attr_accessor :required_attributes

      def validates_presence_of(*attrs)
        self.required_attributes = attrs
      end
    end
  end
end
