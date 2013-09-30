class Classroom < ActiveRecord::Base
  belongs_to :building
  attr_accessible :available_from, :available_until, :name, :sits
end
