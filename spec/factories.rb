FactoryBot.define do
  factory :viability_appraisal, class: ViabilityAppraisal do
    local_authority { "Southwark" }
    local_authority_id { "SWK" }
    application { "ASZDGFH" }
    name { "APP 1" }
    latitude { 9.99 }
    longitude { 9.99 }
    date_submitted { "2019-10-28" }
    gross_development_value { 9.99 }
    construction_costs { 9.99 }
    professional_fees { 9.99 }
    marketing_and_letting { 9.99 }
    finance { 9.99 }
    financial_planning_obligations { 9.99 }
    developer_profit { 9.99 }
    residual_land_value { 9.99 }
    benchmark_land_value { 9.99 }
    residential_units { 1 }
    habitable_rooms { 2 }
    commercial_area_square_meters { 9.99 }
  end
end