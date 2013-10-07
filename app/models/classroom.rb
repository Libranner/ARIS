class Classroom < ActiveRecord::Base
  belongs_to :building
  attr_accessible :name, :sits, :on_floor, :building_id
  validates :sits, numericality: {greater_than: 0}
  validates :on_floor, numericality: {greater_than: 0}
  validate :less_than_total_floors
  #validates :available_from, presence: true
  #validates :available_until, presence: true
  validates :name, uniqueness: true


  def less_than_total_floors
    unless building.nil?
      errors.add(:on_floor, 'field must be less than total of building floors.') if self.on_floor.nil? || self.on_floor > self.building.floors
    end
  end
end