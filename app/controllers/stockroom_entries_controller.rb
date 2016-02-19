class StockroomEntriesController < ApplicationController
  before_action :set_stockroom_entry, only: [:show, :destroy]
  load_and_authorize_resource class: StockroomMovimentation

  # GET /stockroom_entries
  # GET /stockroom_entries.json
  def index
    @stockroom_entries = StockroomMovimentation.entry.order(created_at: :desc)
  end

  # GET /stockroom_entries/1
  # GET /stockroom_entries/1.json
  def show
  end

  # GET /stockroom_entries/new
  def new
    @stockroom_entry = StockroomMovimentation.new
  end

  # POST /stockroom_entries
  # POST /stockroom_entries.json
  def create
    @stockroom_entry = StockroomMovimentation.new(stockroom_entry_params)
    @stockroom_entry.tipo_movimentacao = StockroomMovimentation.tipo_movimentacaos[:entry]

    respond_to do |format|
      if @stockroom_entry.save
        format.html { redirect_to stockroom_entry_path(@stockroom_entry), notice: 'Entrada manual criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PUT APPROVE
  def approve
    @stockroom_entry = StockroomMovimentation.find(params[:stockroom_entry_id])
    @stockroom_entry.aprovada = true
    @stockroom_entry.aprovada_em = Time.now
    @stockroom_entry.stockroom_item.quantidade += @stockroom_entry.quantidade
    @stockroom_entry.save!
    redirect_to stockroom_entries_path, notice: 'Entrada manual aprovada com sucesso.'
  end

  # DELETE /stockroom_entries/1
  # DELETE /stockroom_entries/1.json
  def destroy
    @stockroom_entry.destroy
    respond_to do |format|
      format.html { redirect_to stockroom_entries_url, notice: 'Entrada manual deletada com sucesso.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockroom_entry
      @stockroom_entry = StockroomMovimentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stockroom_entry_params
      params.require(:stockroom_movimentation).permit(:numero_empenho, :numero_processo, :quantidade, :valor_unitario, :justificativa, :stockroom_item_id)
    end
end
