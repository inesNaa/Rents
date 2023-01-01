require "test_helper"

class Car::StepsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get car_steps_show_url
    assert_response :success
  end

  test "should get update" do
    get car_steps_update_url
    assert_response :success
  end
end
