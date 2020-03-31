require 'test_helper'

class CookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookings_index_url
    assert_response :success
  end

  test "should get show" do
    get cookings_show_url
    assert_response :success
  end

  test "should get new" do
    get cookings_new_url
    assert_response :success
  end

  test "should get edit" do
    get cookings_edit_url
    assert_response :success
  end

end
