class AddStoriesToViabilityAppraisals < ActiveRecord::Migration[6.0]
  def change
    add_column :viability_appraisals, :stories, :integer
  end
end
