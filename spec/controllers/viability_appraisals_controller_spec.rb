require 'rails_helper'

RSpec.describe ViabilityAppraisalsController do

  describe "GET #index" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }

    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected number of viability appraisals" do
      json_response = JSON.parse(response.body)
      expect(json_response["data"].count).to equal(20)
    end

    it "JSON body response contains expected attributes for viability appraisals" do
      json_response = JSON.parse(response.body)
      viability_appraisal_serializer = ViabilityAppraisalSerializer.new(viability_appraisals.first)
      expect(json_response["data"].first["attributes"].keys).to eq(viability_appraisal_serializer.serializable_hash[:data][:attributes].keys.map(&:to_s))
    end

  end

  describe "GET #show" do
    let!(:viability_appraisal) { FactoryBot.create(:viability_appraisal) }

    before do
      get :show, params: { id: viability_appraisal.id }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected viability appraisal attributes" do
      json_response = JSON.parse(response.body)
      viability_appraisal_attributes = ViabilityAppraisalSerializer.new(viability_appraisal).serializable_hash[:data][:attributes]
      expect(json_response["data"]["attributes"].keys).to eq(viability_appraisal_attributes.keys.map(&:to_s))
    end

  end

end