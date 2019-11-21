class ViabilityAppraisal < ApplicationRecord
  scope :min_habitable_rooms, -> (min_habitable_rooms) { where("habitable_rooms >= ?", min_habitable_rooms) }
  scope :max_habitable_rooms, -> (max_habitable_rooms) { where("habitable_rooms <= ?", max_habitable_rooms) }
  scope :min_residential_units, -> (min_residential_units) { where("residential_units >= ?", min_residential_units) }
  scope :max_residential_units, -> (max_residential_units) { where("residential_units <= ?", max_residential_units) }
  scope :min_stories, -> (min_stories) { where("stories >= ?", min_stories) }
  scope :max_stories, -> (max_stories) { where("stories <= ?", max_stories) }
  scope :min_gdv, -> (min_gdv) { where("gross_development_value_pence >= ?", min_gdv.to_i * 100) }
  scope :max_gdv, -> (max_gdv) { where("gross_development_value_pence <= ?", max_gdv.to_i * 100) }
  scope :directional_sort, -> (field) { order(field.start_with?('-') ? "#{field[1..-1]} desc NULLS LAST" : "#{field} asc NULLS LAST") }

  def self.habitable_rooms_max
    ViabilityAppraisal.where.not(habitable_rooms: nil).order(habitable_rooms: :desc).first.habitable_rooms
  end

  def self.residential_units_max
    ViabilityAppraisal.where.not(residential_units: nil).order(residential_units: :desc).first.residential_units
  end

  def self.gdv_max
    ViabilityAppraisal.where.not(gross_development_value_pence: nil).order(gross_development_value_pence: :desc).first.gross_development_value_pence * 100
  end

  def self.stories_max
    ViabilityAppraisal.where.not(stories: nil).order(stories: :desc).first.stories
  end
end