class AccountingActionsController < ApplicationController
  before_action :set_accounting_action, only: [:show, :edit, :update, :destroy]

  # GET /accounting_actions
  # GET /accounting_actions.json
  def index
    @q = AccountingAction.ransack(params[:q])
    @accounting_actions = @q.result(distinct: true)
  end

  # GET /accounting_actions/1
  # GET /accounting_actions/1.json
  def show
  end

  # GET /accounting_actions/new
  def new
    @accounting_action = AccountingAction.new
  end

  # GET /accounting_actions/1/edit
  def edit
  end

  # POST /accounting_actions
  # POST /accounting_actions.json
  def create
    @accounting_action = AccountingAction.new(accounting_action_params)

    respond_to do |format|
      if @accounting_action.save
        format.html { redirect_to @accounting_action, notice: 'Ação foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @accounting_action }
      else
        format.html { render :new }
        format.json { render json: @accounting_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_actions/1
  # PATCH/PUT /accounting_actions/1.json
  def update
    respond_to do |format|
      if @accounting_action.update(accounting_action_params)
        format.html { redirect_to @accounting_action, notice: 'Ação foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @accounting_action }
      else
        format.html { render :edit }
        format.json { render json: @accounting_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_actions/1
  # DELETE /accounting_actions/1.json
  def destroy
    @accounting_action.destroy
    respond_to do |format|
      format.html { redirect_to accounting_actions_url, notice: 'Ação foi destruída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_action
      @accounting_action = AccountingAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_action_params
      params.require(:accounting_action).permit(:codigo, :descricao, :exercise_id)
    end
end
