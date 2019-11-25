# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_121600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "viability_appraisals", force: :cascade do |t|
    t.string "local_authority"
    t.string "local_authority_id"
    t.string "application"
    t.string "name"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.date "date_submitted"
    t.bigint "gross_development_value_pence"
    t.bigint "construction_costs_pence"
    t.bigint "professional_fees_pence"
    t.bigint "marketing_and_letting_pence"
    t.bigint "finance_pence"
    t.bigint "financial_planning_obligations_pence"
    t.bigint "developer_profit_pence"
    t.bigint "residual_land_value_pence"
    t.bigint "benchmark_land_value_pence"
    t.integer "residential_units"
    t.integer "habitable_rooms"
    t.bigint "commercial_area_square_centimetres"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "boundary"
    t.integer "stories"
    t.float "affordable_housing_percentage"
  end

end
