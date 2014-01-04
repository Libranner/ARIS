class Reservation < ActiveRecord::Base
  after_update :send_email, if: :state_id_changed?
  attr_accessible :description, :email_petitioner, :name, :start, :finish, :notes, :state_id, :classroom_id, :js_start, :js_finish, :start_date
  belongs_to :classroom
  belongs_to :state
  validates :start, presence: true
  validates :finish, presence: true
  validates :email_petitioner, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :classroom_id, presence: true
  validate :greater_start
  validate :exists_reservation, on: :create



  def send_email
    ReservationMailer.status_changed(self).deliver
  end

  def start_date
    start.to_date unless start.nil?
  end

  def greater_start
    errors.add(:start,', Field. Must be before finish field.') if start.nil? || finish.nil? || self.start >= self.finish
  end

  def exists_reservation
    exists = Reservation.exists?(start: start..finish, finish: start..finish ) #Reservation.where(['start = ?', self.start])
      # OR (start >= ? AND finish <= ?)) AND classroomc_id = ?')
    errors.add(:start, ', Field. There is a reservation in that date.') if exists
  end

  #DateTime Picker

  def time_format(time)
    time.present? ? time.localtime.strftime("%m/%d/%Y %I:%M:%S %p") : time
  end

  def parse_us_time(time)
    time_with_zone = "#{time} #{DateTime.now.strftime("%z")}"
    DateTime.strptime(time_with_zone,"%m/%d/%Y %I:%M:%S %p %z").to_time
  end

  # assuming your database column is called start
  def js_start=(time)
    if time.present?
      write_attribute :start, parse_us_time(time)
    else
      write_attribute :start, time
    end
  end

  # assuming your database column is called start
  def js_start
    time = read_attribute :start
    time_format(time)
  end

  def js_finish=(time)
    if time.present?
      write_attribute :finish, parse_us_time(time)
    else
      write_attribute :finish, time
    end
  end

  # assuming your database column is called finish
  def js_finish
    time = read_attribute :finish
    time_format(time)
  end

  def self.search(date_start, date_finish, room_id, page)
    if date_start && !date_start.empty? && date_finish && !date_start.empty?
      if room_id && !room_id.empty?
        reservations = Reservation.where(['classroom_id: ? AND DATE(start) BETWEEN ? AND ?', room_id, date_start,date_finish])
      else
        reservations = Reservation.where(['DATE(start) BETWEEN ? AND ?', date_start,date_finish])
      end
      reservations.paginate per_page: 10, page: page , order: 'start'
    elsif room_id && !room_id.empty?
      reservations = Reservation.where(['classroom_id = ?', room_id])
      reservations.paginate per_page: 10, page: page , order: 'start'
    else
      paginate per_page: 10, page: page ,:order => 'start'
    end
  end

end
