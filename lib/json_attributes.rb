require 'active_support'

require 'json_attributes/version'

require 'json_attributes/legacy_attributes'
require 'json_attributes/json_attributes'

module JsonAttributes

  attr_accessor :json_attrs, :field

  def json_attributes(field, *json_attrs)
    self.json_attrs = json_attrs
    self.field      = field

    include LegacyAttributes
    prepend JsonAttributes

    store_accessor field, *json_attrs
  end
end
