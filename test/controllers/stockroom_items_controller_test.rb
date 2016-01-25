require 'test_helper'

class StockroomItemsControllerTest < ActionController::TestCase
  setup do
    @stockroom_item = stockroom_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stockroom_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stockroom_item" do
    assert_difference('StockroomItem.count') do
      post :create, stockroom_item: { descricao: @stockroom_item.descricao, quantidade: @stockroom_item.quantidade, valor_unitario_cents: @stockroom_item.valor_unitario_cents }
    end

    assert_redirected_to stockroom_item_path(assigns(:stockroom_item))
  end

  test "should show stockroom_item" do
    get :show, id: @stockroom_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stockroom_item
    assert_response :success
  end

  test "should update stockroom_item" do
    patch :update, id: @stockroom_item, stockroom_item: { descricao: @stockroom_item.descricao, quantidade: @stockroom_item.quantidade, valor_unitario_cents: @stockroom_item.valor_unitario_cents }
    assert_redirected_to stockroom_item_path(assigns(:stockroom_item))
  end

  test "should destroy stockroom_item" do
    assert_difference('StockroomItem.count', -1) do
      delete :destroy, id: @stockroom_item
    end

    assert_redirected_to stockroom_items_path
  end
end
