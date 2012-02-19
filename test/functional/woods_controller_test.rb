require 'test_helper'

class WoodsControllerTest < ActionController::TestCase
  setup do
    @wood = woods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:woods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wood" do
    assert_difference('Wood.count') do
      post :create, wood: @wood.attributes
    end

    assert_redirected_to wood_path(assigns(:wood))
  end

  test "should show wood" do
    get :show, id: @wood
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wood
    assert_response :success
  end

  test "should update wood" do
    put :update, id: @wood, wood: @wood.attributes
    assert_redirected_to wood_path(assigns(:wood))
  end

  test "should destroy wood" do
    assert_difference('Wood.count', -1) do
      delete :destroy, id: @wood
    end

    assert_redirected_to woods_path
  end
end
