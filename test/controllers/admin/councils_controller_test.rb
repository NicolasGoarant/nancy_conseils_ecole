require "test_helper"

class Admin::CouncilsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_councils_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_councils_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_councils_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_councils_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_councils_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_councils_destroy_url
    assert_response :success
  end
end
