class BookingsController < ApplicationController
  before_action :set_booking
  before_action :set_flat

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    # do I need to assign the flat to the booking?
    if @booking.save!
      # we can redirect to the profile page or somewhere else later
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(@booking).permit(:start_date, :end_date, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
