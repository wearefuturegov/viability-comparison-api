class ViabilityAppraisalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :local_authority, :local_authority_id, :application, :name, :latitude, :longitude, :boundary, :date_submitted, :gross_development_value_pence, :construction_costs_pence, :professional_fees_pence, :marketing_and_letting_pence, :finance_pence, :financial_planning_obligations_pence, :developer_profit_pence, :residual_land_value_pence, :benchmark_land_value_pence, :residential_units, :habitable_rooms, :commercial_area_square_centimetres
end
