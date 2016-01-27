class StockroomRemovalsController < ApplicationController
  before_action :set_stockroom_removal, only: [:show, :update, :destroy]

  # GET /stockroom_removals
  # GET /stockroom_removals.json
  def index
    @stockroom_removals = StockroomMovimentation.removal
  end

  # GET /stockroom_removals/1
  # GET /stockroom_removals/1.json
  def show
  end

  # GET /stockroom_removals/new
  def new
    @stockroom_removal = StockroomMovimentation.new
    @stockroom_removal.stockroom_removal_items.build
  end

  # POST /stockroom_removals
  # POST /stockroom_removals.json
  def create
    @stockroom_removal = StockroomMovimentation.new(stockroom_removal_params)
    @stockroom_removal.tipo_movimentacao = StockroomMovimentation.tipo_movimentacaos[:removal]
    @stockroom_removal.aprovada = true # isso é para saber que a movimentação é valida

    password = params[:stockroom_movimentation][:password]

    if ( @stockroom_removal.user.present? && !@stockroom_removal.user.valid_password?(password))
      @stockroom_removal.errors.add(:password, "A senha não confere com a do usuário selecionado.")
      if @stockroom_removal.stockroom_removal_items.empty?
        @stockroom_removal.stockroom_removal_items.build
      end
      render :new and return
    end

    respond_to do |format|
      StockroomMovimentation.transaction do

        if @stockroom_removal.save

          # Notifica o solicitante por e-mail para questão de histórico
          StockroomMailer.notificacao_de_retirada_de_itens(@stockroom_removal).deliver_now

          format.html { redirect_to stockroom_removal_path(@stockroom_removal), notice: 'Saída de estoque criada com sucesso.' }
        else
          if @stockroom_removal.stockroom_removal_items.empty?
            @stockroom_removal.stockroom_removal_items.build
          end
          params[:stockroom_movimentation][:password] = nil
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /stockroom_removals/1
  # PATCH/PUT /stockroom_removals/1.json
  def update
    password = params[:stockroom_movimentation][:password]

    if ( @stockroom_removal.user.present? && !@stockroom_removal.user.valid_password?(password))
      @stockroom_removal.errors.add(:password, "A senha não confere com a do usuário selecionado.")
      render :new and return
    end

    respond_to do |format|
      StockroomMovimentation.transaction do
        @stockroom_removal.stockroom_removal_items.each do |sri|
            sri.stockroom_item.quantidade -= sri.quantidade
        end

        if @stockroom_removal.save

          # Notifica o solicitante por e-mail para questão de histórico
          StockroomMailer.notificacao_de_retirada_de_itens(@stockroom_removal).deliver_now

          format.html { redirect_to @stockroom_removal, notice: 'Saída de estoque criada com sucesso.' }
        else
          if @stockroom_removal.stockroom_removal_items.empty?
            @stockroom_removal.stockroom_removal_items.build
          end
          params[:stockroom_movimentation][:password] = nil
          format.html { render :new }
        end
      end
    end
  end

  # DELETE /stockroom_removals/1
  # DELETE /stockroom_removals/1.json
  def destroy
    @stockroom_removal.destroy
    respond_to do |format|
      format.html { redirect_to stockroom_removals_url, notice: 'Stockroom removal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockroom_removal
      @stockroom_removal = StockroomMovimentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stockroom_removal_params
      params.require(:stockroom_movimentation).permit(:user_id, stockroom_removal_items_attributes: [:id, :stockroom_item_id, :quantidade, :_destroy])
    end
end
