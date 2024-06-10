# app/models/object.rb
class ContentBlock < ApplicationRecord
  store_accessor :properties

  # TODO: How to do this with dynamic schemas
  validates :properties, presence: true, json: { schema: ContentBlockValidator::EMAIL_ADDRESS_SCHEMA }
end
