class Reservation < ActiveRecord::Base
  attr_accessible :description, :email_petitioner, :name, :status
end
