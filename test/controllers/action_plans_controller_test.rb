require 'test_helper'

class ActionPlansControllerTest < ActionController::TestCase
  setup do
    @action_plan = action_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_plan" do
    assert_difference('ActionPlan.count') do
      post :create, action_plan: { exercise_id: @action_plan.exercise_id, nome: @action_plan.nome }
    end

    assert_redirected_to action_plan_path(assigns(:action_plan))
  end

  test "should show action_plan" do
    get :show, id: @action_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_plan
    assert_response :success
  end

  test "should update action_plan" do
    patch :update, id: @action_plan, action_plan: { exercise_id: @action_plan.exercise_id, nome: @action_plan.nome }
    assert_redirected_to action_plan_path(assigns(:action_plan))
  end

  test "should destroy action_plan" do
    assert_difference('ActionPlan.count', -1) do
      delete :destroy, id: @action_plan
    end

    assert_redirected_to action_plans_path
  end
end
