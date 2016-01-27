class StockroomItemsController < ApplicationController
  before_action :set_stockroom_item, only: [:show, :edit, :update, :destroy]

  # GET /stockroom_items
  # GET /stockroom_items.json
  def index
    @stockroom_items = StockroomItem.all
  end

  # GET /stockroom_items/1
  # GET /stockroom_items/1.json
  def show
    @stockroom_movimentations = StockroomMovimentation.where(stockroom_item: @stockroom_item, aprovada: true)
    @stockroom_item.stockroom_removal_items.each do |sri|
      @stockroom_movimentations << sri.stockroom_movimentation
    end
    @stockroom_movimentations = @stockroom_movimentations.sort_by &:created_at
  end

  # GET /stockroom_items/new
  def new
    @stockroom_item = StockroomItem.new
  end

  # GET /stockroom_items/1/edit
  def edit
  end

  # POST /stockroom_items
  # POST /stockroom_items.json
  def create
    @stockroom_item = StockroomItem.new(stockroom_item_params)

    respond_to do |format|
      if @stockroom_item.save
        format.html { redirect_to @stockroom_item, notice: 'Item criado com sucesso.' }
        format.json { render :show, status: :created, location: @stockroom_item }
      else
        format.html { render :new }
        format.json { render json: @stockroom_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockroom_items/1
  # PATCH/PUT /stockroom_items/1.json
  def update
    respond_to do |format|
      if @stockroom_item.update(stockroom_item_params)
        format.html { redirect_to @stockroom_item, notice: 'Item foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @stockroom_item }
      else
        format.html { render :edit }
        format.json { render json: @stockroom_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockroom_items/1
  # DELETE /stockroom_items/1.json
  def destroy
    @stockroom_item.destroy
    respond_to do |format|
      format.html { redirect_to stockroom_items_url, notice: 'Item deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockroom_item
      @stockroom_item = StockroomItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stockroom_item_params
      params.require(:stockroom_item).permit(:descricao)
    end
end
