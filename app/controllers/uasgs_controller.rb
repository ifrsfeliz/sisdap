class UasgsController < ApplicationController
  load_and_authorize_resource #cancan

  before_action :set_uasg, only: [:show, :edit, :update, :destroy]

  # GET /uasgs
  # GET /uasgs.json
  def index
    @uasgs = Uasg.all
  end

  # GET /uasgs/1
  # GET /uasgs/1.json
  def show
  end

  # GET /uasgs/new
  def new
    @uasg = Uasg.new
  end

  # GET /uasgs/1/edit
  def edit
  end

  # POST /uasgs
  # POST /uasgs.json
  def create
    @uasg = Uasg.new(uasg_params)

    respond_to do |format|
      if @uasg.save
        format.html { redirect_to @uasg, notice: 'Uasg was successfully created.' }
        format.json { render :show, status: :created, location: @uasg }
      else
        format.html { render :new }
        format.json { render json: @uasg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uasgs/1
  # PATCH/PUT /uasgs/1.json
  def update
    respond_to do |format|
      if @uasg.update(uasg_params)
        format.html { redirect_to @uasg, notice: 'Uasg was successfully updated.' }
        format.json { render :show, status: :ok, location: @uasg }
      else
        format.html { render :edit }
        format.json { render json: @uasg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uasgs/1
  # DELETE /uasgs/1.json
  def destroy
    @uasg.destroy
    respond_to do |format|
      format.html { redirect_to uasgs_url, notice: 'Uasg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uasg
      @uasg = Uasg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uasg_params
      params.require(:uasg).permit(:codigo, :nome)
    end
end
