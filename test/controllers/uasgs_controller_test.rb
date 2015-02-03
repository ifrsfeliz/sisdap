require 'test_helper'

class UasgsControllerTest < ActionController::TestCase
  setup do
    @uasg = uasgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uasgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uasg" do
    assert_difference('Uasg.count') do
      post :create, uasg: { codigo: @uasg.codigo, nome: @uasg.nome }
    end

    assert_redirected_to uasg_path(assigns(:uasg))
  end

  test "should show uasg" do
    get :show, id: @uasg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uasg
    assert_response :success
  end

  test "should update uasg" do
    patch :update, id: @uasg, uasg: { codigo: @uasg.codigo, nome: @uasg.nome }
    assert_redirected_to uasg_path(assigns(:uasg))
  end

  test "should destroy uasg" do
    assert_difference('Uasg.count', -1) do
      delete :destroy, id: @uasg
    end

    assert_redirected_to uasgs_path
  end
end
