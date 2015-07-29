module JsonAttributes::JsonAttributes

  def attributes
    json_attrs = (self.send(self.field).try(:dup) || {}).with_indifferent_access

    self.json_attrs.each do |attribute|
      json_attrs[attribute] = nil unless json_attrs.has_key?(attribute)
      json_attrs[attribute] ||= self.send(attribute)
    end

    super.merge(json_attrs).with_indifferent_access.slice!(self.field)
  end
end
