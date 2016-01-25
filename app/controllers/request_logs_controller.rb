class RequestLogsController < ApplicationController
  before_action :set_request_log, only: [:show, :edit, :update, :destroy]

  # POST /request_logs
  # POST /request_logs.json
  def create

    @request = Request.find(params[:request_id])
    @request_log = @request.request_logs.new(request_log_params)
    @request_log.user = current_user

    respond_to do |format|
      if @request.save
        format.html { redirect_to :back, notice: 'Assentamento criado com sucesso.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_logs/1
  # DELETE /request_logs/1.json
  def destroy
    @request_log.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Assentamento destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_log
      @request_log = RequestLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_log_params
      params.require(:request_log).permit(:description)
    end
end
