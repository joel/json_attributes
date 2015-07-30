module JsonAttributes::LegacyPredicates
  extend ActiveSupport::Concern

  # class_methods do
  #   @json_attrs.each do |attribute|
  #     define_method :"find_by_#{attribute}" do |value|
  #       self.where("#{@field}->>'#{attribute}' = ?", value)
  #     end
  #   end
  # end

  class_methods do
    def define_question_methods
      @json_attrs.each do |attribute|
        define_method :"#{attribute}?" do
          !!(self.send(self.class.instance_variable_get(:@field)) && self.send(self.class.instance_variable_get(:@field))[attribute.to_s])
        end
      end
    end
  end
end
