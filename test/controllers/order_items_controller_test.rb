require "test_helper"

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_items_create_url
    assert_response :success
  end

  test "should get update" do
    get order_items_update_url
    assert_response :success
  end

  test "should get delete" do
    get order_items_delete_url
    assert_response :success
  end
end
