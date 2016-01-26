require 'test_helper'

class StockroomRemovalsControllerTest < ActionController::TestCase
  setup do
    @stockroom_removal = stockroom_removals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stockroom_removals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stockroom_removal" do
    assert_difference('StockroomRemoval.count') do
      post :create, stockroom_removal: { user_id: @stockroom_removal.user_id }
    end

    assert_redirected_to stockroom_removal_path(assigns(:stockroom_removal))
  end

  test "should show stockroom_removal" do
    get :show, id: @stockroom_removal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stockroom_removal
    assert_response :success
  end

  test "should update stockroom_removal" do
    patch :update, id: @stockroom_removal, stockroom_removal: { user_id: @stockroom_removal.user_id }
    assert_redirected_to stockroom_removal_path(assigns(:stockroom_removal))
  end

  test "should destroy stockroom_removal" do
    assert_difference('StockroomRemoval.count', -1) do
      delete :destroy, id: @stockroom_removal
    end

    assert_redirected_to stockroom_removals_path
  end
end
