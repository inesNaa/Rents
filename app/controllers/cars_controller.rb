class CarsController < ApplicationController
  before_action :set_car, only: %i[edit update destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
  end

  def edit; end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      redirect_to edit_car_path(@car)
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :price_per_day)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :duration)
  end

end
