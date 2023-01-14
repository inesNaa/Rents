class CarsController < ApplicationController
  before_action :set_car, only: %i[edit update destroy]

  def index
    # @cars = Car.all

    @cars = Car.where.not(latitude: nil, longitude: nil)

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/flats/map_box")
      }
    end
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
    if @car.user_id == current_user.id
      @car.destroy
      redirect_to cars_path, notice: "Votre véhicule à bien été supprimé"
    else
      redirect_to cars_path
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end



  @cars = Car.where.not(latitude: nil, longitude: nil)

  @markers = @cars.map do |car|
    {
      lat: car.latitude,
      lng: car.longitude#,
      # infoWindow: { content: render_to_string(partial: "/cars/map_box", locals: { flat: flat }) }
      # Uncomment the above line if you want each of your markers to display a info window when clicked
      # (you will also need to create the partial "/cars/map_box")
    }
  end
end
