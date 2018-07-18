class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-z]{3,}\z/i
      record.errors[attribute] << (options[:message] || I18n.t("invalid.name"))
    end
  end
end

