require 'test_helper'

class StockroomEntriesControllerTest < ActionController::TestCase
  setup do
    @stockroom_entry = stockroom_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stockroom_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stockroom_entry" do
    assert_difference('StockroomEntry.count') do
      post :create, stockroom_entry: { empenho_numero: @stockroom_entry.empenho_numero, justificativa: @stockroom_entry.justificativa, processo_suap_numero: @stockroom_entry.processo_suap_numero, quantidade: @stockroom_entry.quantidade, valor_unitario_cents: @stockroom_entry.valor_unitario_cents }
    end

    assert_redirected_to stockroom_entry_path(assigns(:stockroom_entry))
  end

  test "should show stockroom_entry" do
    get :show, id: @stockroom_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stockroom_entry
    assert_response :success
  end

  test "should update stockroom_entry" do
    patch :update, id: @stockroom_entry, stockroom_entry: { empenho_numero: @stockroom_entry.empenho_numero, justificativa: @stockroom_entry.justificativa, processo_suap_numero: @stockroom_entry.processo_suap_numero, quantidade: @stockroom_entry.quantidade, valor_unitario_cents: @stockroom_entry.valor_unitario_cents }
    assert_redirected_to stockroom_entry_path(assigns(:stockroom_entry))
  end

  test "should destroy stockroom_entry" do
    assert_difference('StockroomEntry.count', -1) do
      delete :destroy, id: @stockroom_entry
    end

    assert_redirected_to stockroom_entries_path
  end
end
