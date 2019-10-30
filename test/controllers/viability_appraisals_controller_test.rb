require 'test_helper'

class ViabilityAppraisalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @viability_appraisal = viability_appraisals(:one)
  end

  test "should get index" do
    get viability_appraisals_url, as: :json
    assert_response :success
  end

  test "should create viability_appraisal" do
    assert_difference('ViabilityAppraisal.count') do
      post viability_appraisals_url, params: { viability_appraisal: { application: @viability_appraisal.application, benchmark_land_value: @viability_appraisal.benchmark_land_value, commercial_area_square_meters: @viability_appraisal.commercial_area_square_meters, construction_costs: @viability_appraisal.construction_costs, date_submitted: @viability_appraisal.date_submitted, developer_profit: @viability_appraisal.developer_profit, finance: @viability_appraisal.finance, financial_planning_obligations: @viability_appraisal.financial_planning_obligations, gross_development_value: @viability_appraisal.gross_development_value, habitable_rooms: @viability_appraisal.habitable_rooms, latitude: @viability_appraisal.latitude, local_authority: @viability_appraisal.local_authority, local_authority_id: @viability_appraisal.local_authority_id, longitude: @viability_appraisal.longitude, marketing_and_letting: @viability_appraisal.marketing_and_letting, name: @viability_appraisal.name, professional_fees: @viability_appraisal.professional_fees, residential_units: @viability_appraisal.residential_units, residual_land_value: @viability_appraisal.residual_land_value } }, as: :json
    end

    assert_response 201
  end

  test "should show viability_appraisal" do
    get viability_appraisal_url(@viability_appraisal), as: :json
    assert_response :success
  end

  test "should update viability_appraisal" do
    patch viability_appraisal_url(@viability_appraisal), params: { viability_appraisal: { application: @viability_appraisal.application, benchmark_land_value: @viability_appraisal.benchmark_land_value, commercial_area_square_meters: @viability_appraisal.commercial_area_square_meters, construction_costs: @viability_appraisal.construction_costs, date_submitted: @viability_appraisal.date_submitted, developer_profit: @viability_appraisal.developer_profit, finance: @viability_appraisal.finance, financial_planning_obligations: @viability_appraisal.financial_planning_obligations, gross_development_value: @viability_appraisal.gross_development_value, habitable_rooms: @viability_appraisal.habitable_rooms, latitude: @viability_appraisal.latitude, local_authority: @viability_appraisal.local_authority, local_authority_id: @viability_appraisal.local_authority_id, longitude: @viability_appraisal.longitude, marketing_and_letting: @viability_appraisal.marketing_and_letting, name: @viability_appraisal.name, professional_fees: @viability_appraisal.professional_fees, residential_units: @viability_appraisal.residential_units, residual_land_value: @viability_appraisal.residual_land_value } }, as: :json
    assert_response 200
  end

  test "should destroy viability_appraisal" do
    assert_difference('ViabilityAppraisal.count', -1) do
      delete viability_appraisal_url(@viability_appraisal), as: :json
    end

    assert_response 204
  end
end
