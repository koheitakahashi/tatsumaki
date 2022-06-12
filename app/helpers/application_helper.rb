module ApplicationHelper
  def attribute_errors(model, attribute)
    model.errors.messages[attribute.to_sym].map do |message|
      "#{model.class.human_attribute_name(attribute.to_sym)}#{message}"
    end.join
  end

  def turbo_stream_flash
    turbo_stream.append "flashes", partial: "flash"
  end
end
