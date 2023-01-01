class BookingsController < ApplicationController
  before_action :set_car, only: %i[index create]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_booking_path(@booking, @car)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :duration, :user_id, :car_id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
