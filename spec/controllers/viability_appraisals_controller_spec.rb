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

    it "JSON body response contains expected values for viability appraisals" do
      json_response = JSON.parse(response.body)
      viability_appraisal_serializer = ViabilityAppraisalSerializer.new(viability_appraisals.first)
      expect(json_response["data"].first["attributes"].values).to eq(JSON.parse(viability_appraisal_serializer.serialized_json)["data"]["attributes"].values)
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

    it "JSON body response contains expected values for a viability appraisal" do
      json_response = JSON.parse(response.body)
      viability_appraisal_serializer = ViabilityAppraisalSerializer.new(viability_appraisal)
      expect(json_response["data"]["attributes"].values).to eq(JSON.parse(viability_appraisal_serializer.serialized_json)["data"]["attributes"].values)
    end

  end

  describe "GET #index filter by habitable rooms" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }
    let!(:on_margin_va) { FactoryBot.create(:viability_appraisal, habitable_rooms: 300) }

    before do
      get :index, params: { min_habitable_rooms: 300, max_habitable_rooms: 700 }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains only viability_appraisals with more than or equal to 300 and less than or equal to 700 habitable rooms" do
      json_response = JSON.parse(response.body)
      viability_appraisal_count = ViabilityAppraisal.where("habitable_rooms >= ?", 300).where("habitable_rooms <= ?", 700).count
      expect(json_response["data"].count).to eq(viability_appraisal_count)
      expect(json_response["data"].last["attributes"]["name"]).to eq(on_margin_va.name)
    end

  end

  describe "GET #index sort by habitable rooms" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }

    it "sorts descending" do
      most_habitable_rooms = ViabilityAppraisal.order(habitable_rooms: :desc).first
      least_habitable_rooms = ViabilityAppraisal.order(habitable_rooms: :desc).last

      get :index, params: { directional_sort: '-habitable_rooms' }
      json_response = JSON.parse(response.body)

      expect(json_response["data"].first["attributes"]["name"]).to eq(most_habitable_rooms.name)
      expect(json_response["data"].last["attributes"]["name"]).to eq(least_habitable_rooms.name)
    end

    it "sorts ascending" do
      most_habitable_rooms = ViabilityAppraisal.order(habitable_rooms: :desc).first
      least_habitable_rooms = ViabilityAppraisal.order(habitable_rooms: :desc).last

      get :index, params: { directional_sort: 'habitable_rooms' }
      json_response = JSON.parse(response.body)

      expect(json_response["data"].first["attributes"]["name"]).to eq(least_habitable_rooms.name)
      expect(json_response["data"].last["attributes"]["name"]).to eq(most_habitable_rooms.name)
    end

  end

  describe "GET #index filter by residential units" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }
    let!(:on_margin_va) { FactoryBot.create(:viability_appraisal, residential_units: 200) }

    before do
      get :index, params: { min_residential_units: 200, max_residential_units: 600 }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains only viability_appraisals with more than or equal to 200 and less than or equal to 600 habitable rooms" do
      json_response = JSON.parse(response.body)
      viability_appraisal_count = ViabilityAppraisal.where("residential_units >= ?", 200).where("residential_units <= ?", 600).count
      expect(json_response["data"].count).to eq(viability_appraisal_count)
      expect(json_response["data"].last["attributes"]["name"]).to eq(on_margin_va.name)
    end

  end

  describe "GET #index filter by stories" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }

    before do
      get :index, params: { min_stories: 20, max_stories: 60 }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains only viability_appraisals with more than or equal to 20 and less than or equal to 60 stories" do
      json_response = JSON.parse(response.body)
      viability_appraisal_count = ViabilityAppraisal.where("stories >= ?", 20).where("stories <= ?", 60).count
      expect(json_response["data"].count).to eq(viability_appraisal_count)
    end
  end

  describe "GET #index filter by GDV" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }

    before do
      get :index, params: { min_gdv: 2000000, max_gdv: 6000000 }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains only viability_appraisals within the correct GDV range" do
      json_response = JSON.parse(response.body)
      viability_appraisal_count = ViabilityAppraisal.where("gross_development_value_pence >= ?", 200000000).where("gross_development_value_pence <= ?", 600000000).count
      expect(json_response["data"].count).to eq(viability_appraisal_count)
    end
  end

  describe "GET #index filter by Commerical area toggle" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 15) }
    let!(:viability_appraisals_no_commercial) { FactoryBot.create_list(:viability_appraisal_no_commercial, 10) }

    it "JSON body response contains only viability_appraisals with commercial area" do
      get :index, params: { commercial: true }
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      viability_appraisals_with_commerical_count = ViabilityAppraisal.where.not(commercial_area_square_centimetres: 0).count
      expect(json_response["data"].count).to eq(viability_appraisals_with_commerical_count)
    end

    it "JSON body response contains only viability_appraisals with no commercial area" do
      get :index, params: { commercial: false }
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      viability_appraisals_with_no_commerical_count = ViabilityAppraisal.where(commercial_area_square_centimetres: 0).count
      expect(json_response["data"].count).to eq(viability_appraisals_with_no_commerical_count)
    end

    it "JSON body response contains all viability_appraisals, commercial area or no commercial area" do
      get :index
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      viability_appraisals_count = ViabilityAppraisal.all.count
      expect(json_response["data"].count).to eq(viability_appraisals_count)
    end
  end

  describe "GET #show only return boundary coordinates" do
    let!(:viability_appraisal) { FactoryBot.create(:viability_appraisal) }

    before do
      get :show, params: { id: viability_appraisal.id }
    end

    it "JSON body response only contains coordinates of GeoJSON boundary field" do
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["attributes"]["boundary"]).to eq(JSON.parse(viability_appraisal.boundary)["features"].first["geometry"])
    end
  end

  describe "GET #index should return upper limits for fields" do
    let!(:viability_appraisals) { FactoryBot.create_list(:viability_appraisal, 20) }

    before do
      get :index
    end

    it "JSON body response contains meta fields for maximum values" do
      max_habitable_rooms = ViabilityAppraisal.order(habitable_rooms: :desc).first.habitable_rooms
      max_residential_units = ViabilityAppraisal.order(residential_units: :desc).first.residential_units
      max_gdv_pounds = ViabilityAppraisal.order(gross_development_value_pence: :desc).first.gross_development_value_pence / 100
      max_stories = ViabilityAppraisal.order(stories: :desc).first.stories
      json_response = JSON.parse(response.body)
      expect(json_response["meta"]["habitable_rooms_max"]).to eq(max_habitable_rooms)
      expect(json_response["meta"]["residential_units_max"]).to eq(max_residential_units)
      expect(json_response["meta"]["gdv_pounds_max"]).to eq(max_gdv_pounds)
      expect(json_response["meta"]["stories_max"]).to eq(max_stories)
    end
  end

   describe "GET #show returns percentages for figures" do
    let!(:viability_appraisal) { FactoryBot.create(:viability_appraisal) }

    before do
      get :show, params: { id: viability_appraisal.id }
    end

    it "JSON body response contains developer profit as a percentage of GDV" do
      json_response = JSON.parse(response.body)
      expect(json_response["data"]["attributes"]["developer_profit_as_percentages_of_gdv"]).to eq((100/viability_appraisal.gross_development_value_pence.to_f * viability_appraisal.developer_profit_pence).round)
    end
  end

end