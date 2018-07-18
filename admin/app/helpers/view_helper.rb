# frozen_string_literal: true

module ViewHelper
   def msg_form_errors(object, field)
    return if object.errors.blank?
    content_tag :div, class: "note valid" do
      object.errors.messages[field.to_sym].each do |message|
        concat content_tag :span, "#{field.to_s.humanize} #{message}", class: "form-errors"
      end
    end
  end
end
