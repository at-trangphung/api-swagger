class PasswordStrongValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    password_format = /\A
      (?=.{8,})          # Must contain 8 or more characters
      (?=.*\d)           # Must contain a digit
      (?=.*[a-z])        # Must contain a lower case character
      (?=.*[A-Z])        # Must contain an upper case character
    /x
    unless value =~ password_format
      record.errors[attribute] << (options[:message] || I18n.t("invalid.password"))
    end
  end
end