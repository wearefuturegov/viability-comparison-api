# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

def to_decimal money_string
  if money_string
    money_string.remove!(",", "£")
    money_string.to_i
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
    gross_development_value: to_decimal(row["Gross Development Value"]),
    construction_costs: to_decimal(row["Construction Costs"]),
    professional_fees: to_decimal(row["Professional Fees"]),
    marketing_and_letting: to_decimal(row["Marketing and Letting"]),
    finance: to_decimal(row["Finance"]),
    financial_planning_obligations: to_decimal(row["Financial planning obligations, Inc AH"]),
    developer_profit: to_decimal(row["Developer Profit"]),
    residual_land_value: to_decimal(row["Residual Land Value"]),
    benchmark_land_value: to_decimal(row["Benchmark Land Value"]),
    residential_units: row["Residential Units"],
    habitable_rooms: row["Habitable Rooms"],
    commercial_area_square_meters: to_decimal(row["Commercial Area"])
  )
  if location = row["Location"]
    va.latitude = location.split(", ")[0]
    va.longitude = location.split(", ")[1]
  end
  va.save
  puts va.inspect
  puts va.errors.inspect
end