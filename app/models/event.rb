class Event < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :sits, :start_date
end
