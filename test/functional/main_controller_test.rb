require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get auth" do
    get :auth
    assert_response :success
  end

  test "should get run" do
    get :run
    assert_response :success
  end

end
