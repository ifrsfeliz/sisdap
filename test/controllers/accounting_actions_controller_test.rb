require 'test_helper'

class AccountingActionsControllerTest < ActionController::TestCase
  setup do
    @accounting_action = accounting_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_action" do
    assert_difference('AccountingAction.count') do
      post :create, accounting_action: { codigo: @accounting_action.codigo, descricao: @accounting_action.descricao, exercise_id: @accounting_action.exercise_id }
    end

    assert_redirected_to accounting_action_path(assigns(:accounting_action))
  end

  test "should show accounting_action" do
    get :show, id: @accounting_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_action
    assert_response :success
  end

  test "should update accounting_action" do
    patch :update, id: @accounting_action, accounting_action: { codigo: @accounting_action.codigo, descricao: @accounting_action.descricao, exercise_id: @accounting_action.exercise_id }
    assert_redirected_to accounting_action_path(assigns(:accounting_action))
  end

  test "should destroy accounting_action" do
    assert_difference('AccountingAction.count', -1) do
      delete :destroy, id: @accounting_action
    end

    assert_redirected_to accounting_actions_path
  end
end
