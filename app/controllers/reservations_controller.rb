class ReservationsController < ApplicationController
  load_and_authorize_resource
  # GET /reservations
  # GET /reservations.json
  def index

    unless params[:date_selected].nil?
      start_date = params[:date_selected] ? params[:date_selected] : params['/reservations'][:start]
      finish_date = params[:date_selected] ? params[:date_selected] : params['/reservations'][:finish]
    end

    classroom_id =
        if params['/reservations'].nil? || params['/reservations'][:classroom_id].nil?
          ''
        else
          params['/reservations'][:classroom_id]
        end


    if params[:view] == '1' || params[:view].nil?
      if start_date.nil? || finish_date.nil?
        @reservations = Reservation.search('','','',params[:page])
      else
        @reservations = Reservation.search(start_date,finish_date,classroom_id , params[:page])
      end
    else
      @reservations = Reservation.all
      @reservations_by_date = @reservations.group_by(&:start_date)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    @reservation = Reservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        #ReservationMailer.status_changed(self).deliver if @reservation.state_id_changed?
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end
end
