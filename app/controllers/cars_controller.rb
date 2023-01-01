class CarsController < ApplicationController
  before_action :set_car, only: %i[edit update destroy]

  def index
    @cars = Car.all
  end

  def new
    @user = current_user.id
    @car = Car.new wizard_complete: false
    @car.user_id = @user
    @car.save! validate: false
    redirect_to car_step_path(@car, Car.form_steps.keys.first)
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
  end

  def edit; end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: "Vos modifications ont bien été enregistrées" }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
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

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
