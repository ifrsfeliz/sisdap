require 'test_helper'

class SupplierGroupsControllerTest < ActionController::TestCase
  setup do
    @supplier_group = supplier_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplier_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier_group" do
    assert_difference('SupplierGroup.count') do
      post :create, supplier_group: { nome: @supplier_group.nome }
    end

    assert_redirected_to supplier_group_path(assigns(:supplier_group))
  end

  test "should show supplier_group" do
    get :show, id: @supplier_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier_group
    assert_response :success
  end

  test "should update supplier_group" do
    patch :update, id: @supplier_group, supplier_group: { nome: @supplier_group.nome }
    assert_redirected_to supplier_group_path(assigns(:supplier_group))
  end

  test "should destroy supplier_group" do
    assert_difference('SupplierGroup.count', -1) do
      delete :destroy, id: @supplier_group
    end

    assert_redirected_to supplier_groups_path
  end
end
