require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get dstroy" do
    get :dstroy
    assert_response :success
  end

end
