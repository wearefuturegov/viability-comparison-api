class CreateViabilityAppraisals < ActiveRecord::Migration[6.0]
  def change
    create_table :viability_appraisals do |t|
      t.string :local_authority
      t.string :local_authority_id
      t.string :application
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.date :date_submitted
      t.decimal :gross_development_value, precision: 15, scale: 2
      t.decimal :construction_costs, precision: 15, scale: 2
      t.decimal :professional_fees, precision: 15, scale: 2
      t.decimal :marketing_and_letting, precision: 15, scale: 2
      t.decimal :finance, precision: 15, scale: 2
      t.decimal :financial_planning_obligations, precision: 15, scale: 2
      t.decimal :developer_profit, precision: 15, scale: 2
      t.decimal :residual_land_value, precision: 15, scale: 2
      t.decimal :benchmark_land_value, precision: 15, scale: 2
      t.integer :residential_units
      t.integer :habitable_rooms
      t.decimal :commercial_area_square_meters, precision: 15, scale: 2

      t.timestamps
    end
  end
end
