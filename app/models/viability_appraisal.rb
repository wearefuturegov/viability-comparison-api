class ViabilityAppraisal < ApplicationRecord
  scope :min_habitable_rooms, -> (min_habitable_rooms) { where("habitable_rooms > ?", min_habitable_rooms) }
  scope :max_habitable_rooms, -> (max_habitable_rooms) { where("habitable_rooms < ?", max_habitable_rooms) }
  scope :directional_sort, -> (field) { order(field.start_with?('-') ? "#{field[1..-1]} desc" : "#{field} asc") }
end