class Office < ActiveRecord::Base
  belongs_to :building
  attr_accessible :close_at, :description, :name, :open_at, :building_id, :on_floor
  validate :greater_open_at
  validate :less_than_total_floors
  validates :close_at, presence: true
  validates :open_at, presence: true
  validates :on_floor, numericality: {greater_than: 0}


  def greater_open_at
    errors.add(:open_at, 'field must be before close_at.') if open_at.nil? || close_at.nil? || self.close_at <= self.open_at
  end

  def less_than_total_floors
    unless building.nil?
      errors.add(:on_floor, 'field must be less than total of building floors.') if self.on_floor.nil? || self.on_floor > self.building.floors
    end
  end

end
