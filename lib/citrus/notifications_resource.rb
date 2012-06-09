require 'citrus'
require 'citrus/subscriber'

module Citrus
  class NotificationsResource < Webmachine::Resource
    def to_html
      Citrus::Subscriber.new.to_enum
    end
  end
end
