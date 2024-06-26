require 'json-schema'

# TODO: Rename "validator" to something else
class ContentBlockValidator
  EMAIL_ADDRESS_SCHEMA = Rails.root.join('config', 'schemas', 'email_address.json')
  TAX_CODE_SCHEMA = Rails.root.join('config', 'schemas', 'tax_code.json')

  # TODO: Try a more complex content type?
  SCHEMAS = ActiveSupport::HashWithIndifferentAccess.new(
    'EmailAddress' => JSON.parse(File.read(EMAIL_ADDRESS_SCHEMA)),
    'TaxCode' => JSON.parse(File.read(TAX_CODE_SCHEMA))
  )

  def self.schema_for(type)
    camelType = type.split('_').map(&:capitalize).join
    SCHEMAS[camelType]
  end

  def self.default_properties(type)
    schema = schema_for(type)
    properties = schema[:properties]

    properties.each_with_object({}) do |(key, value), defaults|
      defaults[key] = value[:default] if value.key?(:default)
    end
  end
end
