class ViabilityAppraisalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :local_authority, :local_authority_id, :application, :name, :latitude, :longitude, :date_submitted, :stories, :gross_development_value_pence, :construction_costs_pence, :professional_fees_pence, :marketing_and_letting_pence, :finance_pence, :financial_planning_obligations_pence, :developer_profit_pence, :residual_land_value_pence, :benchmark_land_value_pence, :residential_units, :habitable_rooms, :commercial_area_square_centimetres, :developer_profit_as_percentage_of_gdv, :finance_as_percentage_of_gdv

  attribute :boundary do |object|
    JSON.parse(object.boundary)["features"].first["geometry"] if object.boundary
  end

  attribute :developer_profit_as_percentage_of_gdv do |object|
    if object.developer_profit_pence
      (100 / object.gross_development_value_pence.to_f * object.developer_profit_pence).round
    else
      nil
    end
  end

  attribute :finance_as_percentage_of_gdv do |object|
    if object.finance_pence
      (100 / object.gross_development_value_pence.to_f * object.finance_pence).round
    else
      nil
    end
  end

end
