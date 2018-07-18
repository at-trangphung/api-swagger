class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A(09|01[2|6|8|9])+([0-9]{8})\b/i
      record.errors[attribute] << (options[:message] || I18n.t("invalid.phonenumber"))
    end
  end
end
