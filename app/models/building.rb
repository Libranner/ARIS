class Building < ActiveRecord::Base
  attr_accessible :abbreviation, :floors, :name, :rooms, :classrooms_attributes, :offices_attributes
  validates :abbreviation, length: {is: 2}
  validates :rooms, numericality: {greater_than: 0}
  validates :floors, numericality: {greater_than: 0}
  validates :name, uniqueness: true
  has_many :classrooms
  has_many :offices
  accepts_nested_attributes_for :classrooms, allow_destroy: true
  accepts_nested_attributes_for :offices, allow_destroy: true
end
