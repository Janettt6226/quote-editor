require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "pages#home"
    assert_response :success
  end
end
