class EmailValidator < ActiveModel::EachValidator
  def initialize(options)
    options.reverse_merge!(message: :email)
    super(options)
  end

  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add(attribute, options.fetch(:message), value: value)
    end
  end
end
