require 'test_helper'

class AcTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ac_test_index_url
    assert_response :success
  end

end
