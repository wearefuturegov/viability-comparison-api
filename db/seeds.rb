# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

def to_pence money_string
  if money_string
    money_string.tr!('^0-9', '')
    money_string.to_i * 100
  else
    nil
  end
end

def to_centimetres measurement_string
  if measurement_string
    measurement_string.tr!('^0-9', '')
    measurement_string.to_i * 100
  else
    nil
  end
end

CSV.foreach(Rails.root.join('lib/viability_appraisals.csv'), headers: true) do |row|
  va = ViabilityAppraisal.new(
    local_authority: row["Local Authority"],
    local_authority_id: row["LA ID"],
    application: row["Site (application)"],
    name: row["Name"],
    date_submitted: row["Date"],
    gross_development_value_pence: to_pence(row["Gross Development Value"]),
    construction_costs_pence: to_pence(row["Construction Costs"]),
    professional_fees_pence: to_pence(row["Professional Fees"]),
    marketing_and_letting_pence: to_pence(row["Marketing and Letting"]),
    finance_pence: to_pence(row["Finance"]),
    financial_planning_obligations_pence: to_pence(row["Financial planning obligations, Inc AH"]),
    developer_profit_pence: to_pence(row["Developer Profit"]),
    residual_land_value_pence: to_pence(row["Residual Land Value"]),
    benchmark_land_value_pence: to_pence(row["Benchmark Land Value"]),
    residential_units: row["Residential Units"],
    habitable_rooms: row["Habitable Rooms"],
    commercial_area_square_centimetres: to_centimetres(row["Commercial Area"]),
    boundary: row["Boundary GeoJSON"],
    stories: row["Storeys"]
  )
  if location = row["Location Coordinates"]
    va.latitude = location.split(", ")[0]
    va.longitude = location.split(", ")[1]
  end
  va.save
  puts va.inspect
  puts va.errors.inspect
end