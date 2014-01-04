require 'digest/sha2'

class ReservationMailer < ActionMailer::Base
  default from: 'libranner@gmail.com'

  def status_changed(reservation)
    @reservation = reservation
    mail(:to => reservation.email_petitioner, subject: 'Reservation status')
  end
end
