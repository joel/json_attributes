require 'active_support'

require 'json_attributes/version'

require 'json_attributes/legacy_predicates'
require 'json_attributes/legacy_attributes'

module JsonAttributes
  extend ActiveSupport::Concern

  included do
    include LegacyPredicates
    prepend LegacyAttributes
  end

  class_methods do
    def json_attributes(field, *json_attrs)
      @json_attrs = json_attrs
      @field      = field

      define_question_methods

      store_accessor field, *json_attrs
    end
  end
end
