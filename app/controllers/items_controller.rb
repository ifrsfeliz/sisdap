class ItemsController < ApplicationController
  before_action :load_resources, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  def for_aquisition
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @bid = Bid.find(params[:bid_id])
    @item = @bid.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @bid = Bid.find(params[:bid_id])
    @item = @bid.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @bid, notice: 'Item criado com sucesso.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @bid, notice: 'Item atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to bid_path(@bid), notice: 'Item destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      @bid = Bid.find(params[:bid_id])
      @item = @bid.items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item, :item_classification_id, :descricao, :supplier_id, :validade, :unidade, :quantidade, :valor_unitario, :tipo, :observacao, :ativo, :bid_id)
    end
end
