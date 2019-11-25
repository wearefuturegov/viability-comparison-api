class AddAffordableHousingPercentageToViabilityAppraisals < ActiveRecord::Migration[6.0]
  def change
    add_column :viability_appraisals, :affordable_housing_percentage, :float
  end
end
