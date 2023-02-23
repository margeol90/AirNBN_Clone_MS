class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flats = Flat.all
  end

  def my_flats
    @flats = Flat.where(user_id: current_user.id)
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
    @review = Review.new
  end
end
