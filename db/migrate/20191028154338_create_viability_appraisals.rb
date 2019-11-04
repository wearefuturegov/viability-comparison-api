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
      t.integer :gross_development_value_pence, limit: 8
      t.integer :construction_costs_pence, limit: 8
      t.integer :professional_fees_pence, limit: 8
      t.integer :marketing_and_letting_pence, limit: 8
      t.integer :finance_pence, limit: 8
      t.integer :financial_planning_obligations_pence, limit: 8
      t.integer :developer_profit_pence, limit: 8
      t.integer :residual_land_value_pence, limit: 8
      t.integer :benchmark_land_value_pence, limit: 8
      t.integer :residential_units
      t.integer :habitable_rooms
      t.integer :commercial_area_square_centimetres, limit: 8

      t.timestamps
    end
  end
end
