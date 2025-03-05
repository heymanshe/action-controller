require "test_helper"

class BasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get baskets_show_url
    assert_response :success
  end

  test "should get update" do
    get baskets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get baskets_destroy_url
    assert_response :success
  end
end
