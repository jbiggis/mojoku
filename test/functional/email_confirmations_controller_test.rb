require 'test_helper'

class EmailConfirmationsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get verify" do
    get :verify
    assert_response :success
  end

end
