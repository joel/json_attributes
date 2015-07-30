module JsonAttributes::LegacyPredicates
  extend ActiveSupport::Concern

  class_methods do
    def define_question_methods
      @json_attrs.each do |attribute|
        define_method :"#{attribute}?" do
          !!(self.send(self.class.instance_variable_get(:@field)) && self.send(self.class.instance_variable_get(:@field))[attribute.to_s])
        end
        define_singleton_method :"find_by_#{attribute}" do |value|
          self.where("#{self.instance_variable_get(:@field)}->>'#{attribute}' = ?", value).first
        end
      end
    end
  end
end
