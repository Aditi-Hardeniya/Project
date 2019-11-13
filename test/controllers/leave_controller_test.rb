require 'test_helper'

class LeaveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leave_index_url
    assert_response :success
  end

end
