module JsonAttributes::LegacyAttributes

  def attributes
    _json_attrs = (self.send(self.class.instance_variable_get(:@field)).try(:dup) || {}).with_indifferent_access

    self.class.instance_variable_get(:@json_attrs).each do |_attribute|
      _json_attrs[_attribute] = nil unless _json_attrs.has_key?(_attribute)
      _json_attrs[_attribute] ||= self.send(_attribute)
    end

    super.merge(_json_attrs).with_indifferent_access.slice!(self.class.instance_variable_get(:@field))
  end
end
