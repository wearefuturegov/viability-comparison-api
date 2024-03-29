class ViabilityAppraisalsController < ApplicationController
  before_action :set_viability_appraisal, only: [:show, :update, :destroy]

  # GET /viability_appraisals
  def index
    if params[:id]
      @viability_appraisals = ViabilityAppraisal.find(params[:id].split(","))
    else
      @viability_appraisals = ViabilityAppraisal.all
    end

    filtering_params(params).each do |key, value|
      @viability_appraisals = @viability_appraisals.public_send(key, value) if value.present?
    end

    options = {}
    options[:meta] = {
      habitable_rooms_max: ViabilityAppraisal.habitable_rooms_max,
      residential_units_max: ViabilityAppraisal.residential_units_max,
      stories_max: ViabilityAppraisal.stories_max,
      gdv_pounds_max: ViabilityAppraisal.gdv_pounds_max
    }
    render json: ViabilityAppraisalSerializer.new(@viability_appraisals, options)
  end

  # GET /viability_appraisals/1
  def show
    render json: ViabilityAppraisalSerializer.new(@viability_appraisal)
  end

  # POST /viability_appraisals
  # def create
  #   @viability_appraisal = ViabilityAppraisal.new(viability_appraisal_params)

  #   if @viability_appraisal.save
  #     render json: @viability_appraisal, status: :created, location: @viability_appraisal
  #   else
  #     render json: @viability_appraisal.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /viability_appraisals/1
  # def update
  #   if @viability_appraisal.update(viability_appraisal_params)
  #     render json: @viability_appraisal
  #   else
  #     render json: @viability_appraisal.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /viability_appraisals/1
  # def destroy
  #   @viability_appraisal.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viability_appraisal
      @viability_appraisal = ViabilityAppraisal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def viability_appraisal_params
      params.require(:viability_appraisal).permit(:local_authority, :local_authority_id, :application, :name, :latitude, :longitude, :date_submitted, :gross_development_value, :construction_costs, :professional_fees, :marketing_and_letting, :finance, :financial_planning_obligations, :developer_profit, :residual_land_value, :benchmark_land_value, :residential_units, :habitable_rooms, :commercial_area_square_meters, :affordable_housing_percentage)
    end

    def filtering_params(params)
      params.slice(:min_habitable_rooms, :max_habitable_rooms, :min_residential_units, :max_residential_units, :min_stories, :max_stories, :min_gdv, :max_gdv, :directional_sort, :commercial)
    end
end
