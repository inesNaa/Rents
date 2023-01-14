class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  default_scope { where wizard_complete: true }
  scope :wizard_not_completed_only, -> { unscope(where: :wizard_complete).where(wizard_complete: false) }

  enum form_steps: {
    car_details: [:type_of_vehicle, :brand, :model],
    mileage: [:mileage],
    registration: [:plate_number, :year, :car_country],
    energy_and_transmission: [:fuel, :gearbox],
    doors_and_seats: [:doors, :seats],
    options: [:options],
    price: [:price_per_day, :address]
  }

  attr_accessor :form_step

  with_options if: -> { required_for_step?(:car_details) } do
    validates :type_of_vehicle, presence: true
    validates :brand, presence: true
    validates :model, presence: true
  end

  with_options if: -> { required_for_step?(:mileage) } do
    validates :mileage, presence: true
  end

  with_options if: -> { required_for_step?(:registration) } do
    validates :plate_number, presence: true
    validates :year, presence: true
    validates :car_country, presence: true
  end

  with_options if: -> { required_for_step?(:energy_and_transmission) } do
    validates :fuel, presence: true
    validates :gearbox, presence: true
  end

  with_options if: -> { required_for_step?(:doors_and_seats) } do
    validates :doors, presence: true
    validates :seats, presence: true
  end

  with_options if: -> { required_for_step?(:options) } do
    validates :options, presence: true
  end

  with_options if: -> { required_for_step?(:price) } do
    validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :address, presence: true
  end


  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?

    # All fields from previous steps are required
    ordered_keys = self.class.form_steps.keys.map(&:to_sym)
    !!(ordered_keys.index(step) <= ordered_keys.index(form_step))
  end


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
