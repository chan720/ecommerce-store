require "test_helper"

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_items_new_url
    assert_response :success
  end

  test "should get create" do
    get order_items_create_url
    assert_response :success
  end

  test "should get index" do
    get order_items_index_url
    assert_response :success
  end

  test "should get show" do
    get order_items_show_url
    assert_response :success
  end
end
