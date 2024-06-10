# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_07_165629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_blocks", force: :cascade do |t|
    t.string "block_type"
    # t.jsonb "schema" as an option, as well as hardcoded schemas they could be
    # stored in data if users needed to create them later
    t.jsonb "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # ContentBlock.all
  #   => tax_code
  #   => email_address
  #   => contact_block # How would blocks that were built from other blocks work?
  #     - email_address ?
  #     - phone_number ?
  #     - address ?

  # 100 controllers
  # 100 presenters
  # 100 tables

  # TODO: try the alternative of having the tables for each type

end
