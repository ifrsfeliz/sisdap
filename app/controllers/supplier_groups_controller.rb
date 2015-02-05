class SupplierGroupsController < ApplicationController
  before_action :set_supplier_group, only: [:show, :edit, :update, :destroy]

  # GET /supplier_groups
  # GET /supplier_groups.json
  def index
    @supplier_groups = SupplierGroup.all
  end

  # GET /supplier_groups/1
  # GET /supplier_groups/1.json
  def show
  end

  # GET /supplier_groups/new
  def new
    @supplier_group = SupplierGroup.new
  end

  # GET /supplier_groups/1/edit
  def edit
  end

  # POST /supplier_groups
  # POST /supplier_groups.json
  def create
    @supplier_group = SupplierGroup.new(supplier_group_params)

    respond_to do |format|
      if @supplier_group.save
        format.html { redirect_to @supplier_group, notice: 'Supplier group was successfully created.' }
        format.json { render :show, status: :created, location: @supplier_group }
      else
        format.html { render :new }
        format.json { render json: @supplier_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier_groups/1
  # PATCH/PUT /supplier_groups/1.json
  def update
    respond_to do |format|
      if @supplier_group.update(supplier_group_params)
        format.html { redirect_to @supplier_group, notice: 'Supplier group was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier_group }
      else
        format.html { render :edit }
        format.json { render json: @supplier_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_groups/1
  # DELETE /supplier_groups/1.json
  def destroy
    @supplier_group.destroy
    respond_to do |format|
      format.html { redirect_to supplier_groups_url, notice: 'Supplier group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_group
      @supplier_group = SupplierGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_group_params
      params.require(:supplier_group).permit(:nome)
    end
end
