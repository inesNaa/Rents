class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :user_connected, only: [:index, :new ]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render new, status: :unprocessable_entity
    end
  end

  def show; end

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

  def user_connected
    @user = current_user
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :price_per_day)
  end
end
