class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]
  before_action :set_flat, only: %i[new create edit update]

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save!
      # we can redirect to the profile page or somewhere else later
      redirect_to my_bookings_path
    else
      render :new, notice: "Your booking was not processed. Try again"
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)

    redirect_to my_bookings_path
    # waiting for show page to fix redirect, and maybe write a conditional estatement
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path(@booking), status: :see_other
    # redirect_to my_bookings_path(@booking), notice: "Booking reservation was been cancelled"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :adults, :children)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end
end
