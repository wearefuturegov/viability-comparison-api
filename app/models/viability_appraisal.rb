class ViabilityAppraisal < ApplicationRecord
  scope :min_habitable_rooms, -> (min_habitable_rooms) { where("habitable_rooms >= ?", min_habitable_rooms) }
  scope :max_habitable_rooms, -> (max_habitable_rooms) { where("habitable_rooms <= ?", max_habitable_rooms) }
  scope :min_residential_units, -> (min_residential_units) { where("residential_units >= ?", min_residential_units) }
  scope :max_residential_units, -> (max_residential_units) { where("residential_units <= ?", max_residential_units) }
  scope :directional_sort, -> (field) { order(field.start_with?('-') ? "#{field[1..-1]} desc NULLS LAST" : "#{field} asc NULLS LAST") }
end