class ItemClassificationsController < ApplicationController
  before_action :set_item_classification, only: [:show, :edit, :update, :destroy]

  # GET /item_classifications
  # GET /item_classifications.json
  def index
    @item_classifications = ItemClassification.all
  end

  # GET /item_classifications/1
  # GET /item_classifications/1.json
  def show
  end

  # GET /item_classifications/new
  def new
    @item_classification = ItemClassification.new
  end

  # GET /item_classifications/1/edit
  def edit
  end

  # POST /item_classifications
  # POST /item_classifications.json
  def create
    @item_classification = ItemClassification.new(item_classification_params)

    respond_to do |format|
      if @item_classification.save
        format.html { redirect_to @item_classification, notice: 'Classificação criada com sucesso.' }
        format.json { render :show, status: :created, location: @item_classification }
      else
        format.html { render :new }
        format.json { render json: @item_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_classifications/1
  # PATCH/PUT /item_classifications/1.json
  def update
    respond_to do |format|
      if @item_classification.update(item_classification_params)
        format.html { redirect_to @item_classification, notice: 'Classificação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @item_classification }
      else
        format.html { render :edit }
        format.json { render json: @item_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_classifications/1
  # DELETE /item_classifications/1.json
  def destroy
    @item_classification.destroy
    respond_to do |format|
      format.html { redirect_to item_classifications_url, notice: 'Classificação destruída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_classification
      @item_classification = ItemClassification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_classification_params
      params.require(:item_classification).permit(:nome)
    end
end
