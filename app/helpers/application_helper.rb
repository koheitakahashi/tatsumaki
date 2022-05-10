module ApplicationHelper
  def attribute_errors(model, attribute)
    model.errors.messages[attribute.to_sym].map do |message|
      "#{model.class.human_attribute_name(attribute.to_sym)}#{message}"
    end.join
  end
end
