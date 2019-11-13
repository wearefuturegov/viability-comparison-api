require 'faker'

FactoryBot.define do
  factory :viability_appraisal, class: ViabilityAppraisal do
    local_authority { "Southwark" }
    local_authority_id { "SWK" }
    application { "ASZDGFH" }
    name { Faker::Name.name }
    latitude { 999 }
    longitude { 999 }
    date_submitted { "2019-10-28" }
    gross_development_value_pence { 999 }
    construction_costs_pence { 999 }
    professional_fees_pence { 999 }
    marketing_and_letting_pence { 999 }
    finance_pence { 999 }
    financial_planning_obligations_pence { 999 }
    developer_profit_pence { 999 }
    residual_land_value_pence { 999 }
    benchmark_land_value_pence { 999 }
    residential_units { rand(800) }
    habitable_rooms { rand(1000) }
    commercial_area_square_centimetres{ 999 }
  end
end