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

    it "JSON body response contains expected viability appraisals" do
      json_response = JSON.parse(response.body)
      expect(json_response.count).to equal(20)
      expect(json_response.first.keys).to match_array(ViabilityAppraisal.first.attributes.keys)
    end

  end

end