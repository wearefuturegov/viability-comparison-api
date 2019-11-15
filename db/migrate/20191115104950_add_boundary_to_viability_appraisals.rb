class AddBoundaryToViabilityAppraisals < ActiveRecord::Migration[6.0]
  def change
    add_column :viability_appraisals, :boundary, :json
  end
end
