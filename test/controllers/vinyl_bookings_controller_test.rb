require "test_helper"

class VinylBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get calculate_total_price" do
    get vinyl_bookings_calculate_total_price_url
    assert_response :success
  end
end
