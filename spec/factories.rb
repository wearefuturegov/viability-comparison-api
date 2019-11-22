require 'faker'

FactoryBot.define do
  factory :viability_appraisal, class: ViabilityAppraisal do
    local_authority { "Southwark" }
    local_authority_id { "SWK" }
    application { "ASZDGFH" }
    name { Faker::Name.name }
    latitude { 999 }
    longitude { 999 }
    boundary { "{\"type\": \"FeatureCollection\",\"name\": \"planningApps\",\"crs\": { \"type\": \"name\", \"properties\": { \"name\": \"urn:ogc:def:crs:EPSG::27700\" } },\"features\": [{ \"type\": \"Feature\", \"properties\": { \"refval\": \"18\\/AP\\/1603\", \"keyval\": \"ZZZV0PKBWR258\", \"datemodified\": \"2018\\/06\\/08\", \"address\": \"Sampson House\\r64 Hopton Street\\rLondon\\rSE1 9JH\", \"description\": \"Redevelopment to create two levels of basement and the erection of five buildings ranging from seven to 34 storeys plus plant (heights ranging from 28.9m AOD ¿ 123.9m AOD) to provide: 341 dwellings (Class C3); 8,054sqm (GIA) of office space (Class B1); 1,436sqm (GIA) of retail floorspace (Class A1-A4); 904sqm (GIA) of cultural floorspace (Class D1\\/D2); 16,254sqm (GIA) hotel with up to 126 rooms (Class C1); new open space; reconfigured vehicular and pedestrian access; highway works; landscaping; basement car park for 107 cars (including 29 disabled car parking spaces), plus servicing and plant areas; and works associated and ancillary to the proposed development.\\r\\rThe application is accompanied by an Environmental Statement submitted pursuant to the Town and Country Planning (Environmental Impact Assessment) Regulations 2017. A hard copy of the application documents is available for inspection by prior appointment at Southwark Council's offices, 160 Tooley Street, SE1 2QH (Monday to Friday 9am to 5pm). Copies of the Non-Technical Summary are available free of charge and printed\\/electronic copies of the Environmental Statement can be purchased. To request a copy of the Non-Technical Summary or to purchase the ES  please contact: Trium Environmental Consulting LLP,  69-85 Tabernacle Street, London EC2A 4BD or by email at hello@triumenv.co.uk or Telephone: +44 (0) 203 887 7118.\\r\\r\", \"ispavisible\": 1.0, \"iscavisible\": 1.0, \"shape.AREA\": 0.0, \"shape.LEN\": 0.0, \"se_sdo_rowid\": 34137 }, \"geometry\": { \"type\": \"MultiPolygon\", \"coordinates\": [ [ [ [ 531735.15, 180504.250000001047738 ], [ 531776.668, 180505.581000000878703 ], [ 531779.698, 180502.101000000839122 ], [ 531783.104, 180355.423000000184402 ], [ 531771.552, 180353.953000000212342 ], [ 531767.199, 180347.145000000251457 ], [ 531761.502, 180339.848000000813045 ], [ 531740.097, 180353.204000000434462 ], [ 531739.85, 180357.402 ], [ 531732.199, 180361.701000000874046 ], [ 531726.848, 180446.447 ], [ 531729.247, 180452.155000000318978 ], [ 531731.58, 180461.593 ], [ 531730.302, 180498.002000000153203 ], [ 531732.05, 180499.952000000281259 ], [ 531735.15, 180504.250000001047738 ] ] ], [ [ [ 531776.668, 180505.581000000878703 ], [ 531775.65, 180506.750000000116415 ], [ 531777.25, 180505.60000000015134 ], [ 531776.668, 180505.581000000878703 ] ] ] ] } }]}" }
    date_submitted { "2019-10-28" }
    gross_development_value_pence { rand(800000000) }
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
    stories { rand(100) }
    commercial_area_square_centimetres{ 999 }
  end

  factory :viability_appraisal_no_commercial, class: ViabilityAppraisal do
    local_authority { "Southwark" }
    local_authority_id { "SWK" }
    application { "ASZDGFH" }
    name { Faker::Name.name }
    latitude { 999 }
    longitude { 999 }
    boundary { "{\"type\": \"FeatureCollection\",\"name\": \"planningApps\",\"crs\": { \"type\": \"name\", \"properties\": { \"name\": \"urn:ogc:def:crs:EPSG::27700\" } },\"features\": [{ \"type\": \"Feature\", \"properties\": { \"refval\": \"18\\/AP\\/1603\", \"keyval\": \"ZZZV0PKBWR258\", \"datemodified\": \"2018\\/06\\/08\", \"address\": \"Sampson House\\r64 Hopton Street\\rLondon\\rSE1 9JH\", \"description\": \"Redevelopment to create two levels of basement and the erection of five buildings ranging from seven to 34 storeys plus plant (heights ranging from 28.9m AOD ¿ 123.9m AOD) to provide: 341 dwellings (Class C3); 8,054sqm (GIA) of office space (Class B1); 1,436sqm (GIA) of retail floorspace (Class A1-A4); 904sqm (GIA) of cultural floorspace (Class D1\\/D2); 16,254sqm (GIA) hotel with up to 126 rooms (Class C1); new open space; reconfigured vehicular and pedestrian access; highway works; landscaping; basement car park for 107 cars (including 29 disabled car parking spaces), plus servicing and plant areas; and works associated and ancillary to the proposed development.\\r\\rThe application is accompanied by an Environmental Statement submitted pursuant to the Town and Country Planning (Environmental Impact Assessment) Regulations 2017. A hard copy of the application documents is available for inspection by prior appointment at Southwark Council's offices, 160 Tooley Street, SE1 2QH (Monday to Friday 9am to 5pm). Copies of the Non-Technical Summary are available free of charge and printed\\/electronic copies of the Environmental Statement can be purchased. To request a copy of the Non-Technical Summary or to purchase the ES  please contact: Trium Environmental Consulting LLP,  69-85 Tabernacle Street, London EC2A 4BD or by email at hello@triumenv.co.uk or Telephone: +44 (0) 203 887 7118.\\r\\r\", \"ispavisible\": 1.0, \"iscavisible\": 1.0, \"shape.AREA\": 0.0, \"shape.LEN\": 0.0, \"se_sdo_rowid\": 34137 }, \"geometry\": { \"type\": \"MultiPolygon\", \"coordinates\": [ [ [ [ 531735.15, 180504.250000001047738 ], [ 531776.668, 180505.581000000878703 ], [ 531779.698, 180502.101000000839122 ], [ 531783.104, 180355.423000000184402 ], [ 531771.552, 180353.953000000212342 ], [ 531767.199, 180347.145000000251457 ], [ 531761.502, 180339.848000000813045 ], [ 531740.097, 180353.204000000434462 ], [ 531739.85, 180357.402 ], [ 531732.199, 180361.701000000874046 ], [ 531726.848, 180446.447 ], [ 531729.247, 180452.155000000318978 ], [ 531731.58, 180461.593 ], [ 531730.302, 180498.002000000153203 ], [ 531732.05, 180499.952000000281259 ], [ 531735.15, 180504.250000001047738 ] ] ], [ [ [ 531776.668, 180505.581000000878703 ], [ 531775.65, 180506.750000000116415 ], [ 531777.25, 180505.60000000015134 ], [ 531776.668, 180505.581000000878703 ] ] ] ] } }]}" }
    date_submitted { "2019-10-28" }
    gross_development_value_pence { rand(800000000) }
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
    stories { rand(100) }
    commercial_area_square_centimetres{ 0 }
  end
end