require 'test_helper'

class CookingCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cooking_categories_index_url
    assert_response :success
  end

end
