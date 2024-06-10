require 'json-schema'

class ContentBlockValidator
  SCHEMAS = {
    'EmailAddress' => {
      type: 'email_address',
      properties: {
        email_address: { type: 'string', default: '' }
      },
      required: ['email_address']
    },
    'TaxCode' => {
      type: 'tax_code',
      properties: {
        code: { type: 'string', default: '' },
        explanation: { type: 'string', default: '' }
      },
      required: ['tax_code']
    }
    # Add more schemas for other ContentBlock types
  }.freeze

  def self.validate(type, data)
    JSON::Validator.validate!(schema_for(type), data)
  end

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
