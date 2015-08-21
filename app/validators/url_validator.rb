class UrlValidator < ActiveModel::EachValidator
  def initialize(options)
    options.reverse_merge!(schemes: %w(http https))
    options.reverse_merge!(preferred_scheme: 'http://')
    options.reverse_merge!(message: :url)
    super(options)
  end

  def validate_each(record, attribute, value)
    schemes = [*options.fetch(:schemes)].map(&:to_s)
    begin
      uri = URI.parse(value)
      preferred_scheme = options.fetch(:preferred_scheme)

      if uri.scheme.blank? && preferred_scheme.present?
        value = preferred_scheme + record.send(attribute).to_s
        record.send("#{attribute}=", value)
        uri = URI.parse(value)
      end

      unless uri && uri.host && schemes.include?(uri.scheme)
        record.errors.add(attribute, options.fetch(:message), value: value)
      end
    rescue URI::InvalidURIError
      record.errors.add(attribute, options.fetch(:message), value: value)
    end
  end
end
