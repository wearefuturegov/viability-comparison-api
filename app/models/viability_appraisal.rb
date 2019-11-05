class ViabilityAppraisal < ApplicationRecord
  scope :min_habitable_rooms, -> (min_habitable_rooms) { where("habitable_rooms > ?", min_habitable_rooms) }
  scope :max_habitable_rooms, -> (max_habitable_rooms) { where("habitable_rooms < ?", max_habitable_rooms) }
end
