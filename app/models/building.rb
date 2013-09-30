class Building < ActiveRecord::Base
  attr_accessible :abbreviation, :floors, :name, :rooms
  validates :abbreviation, length: {is: 2}
  validates :rooms, numericality: {greater_than: 0}
  validates :floors, numericality: {greater_than: 0}
  has_many :classrooms


end
