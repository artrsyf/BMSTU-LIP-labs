require "test_helper"

class SolutionControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get solution_input_url
    assert_response :success
  end

  test "should get show" do
    get solution_show_url
    assert_response :success
  end
end
