require "test_helper"

class LineBotControllerTest < ActionDispatch::IntegrationTest
  test "should get callback" do
    post callback_path
    assert_response :success
  end
end
