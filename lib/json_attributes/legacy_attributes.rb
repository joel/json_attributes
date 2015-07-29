module JsonAttributes::LegacyAttributes
  extend ActiveSupport::Concern

  included do
    self.json_attrs.each do |attribute|
      define_method :"#{attribute}?" do
        !!(self.send(self.field) && self.send(self.field)[attribute.to_s])
      end
    end
  end

  # class_methods do
  #   self.json_attrs.each do |attribute|
  #     define_method :"find_by_#{attribute}" do |value|
  #       self.where("#{self.field}->>'#{attribute}' = ?", value)
  #     end
  #   end
  # end

end
