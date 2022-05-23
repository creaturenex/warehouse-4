class ItemsController < ApplicationController
  before_action :get_inventory
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = @inventory.items
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = @inventory.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = @inventory.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to inventory_items_url(@inventory), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to inventory_item_url(@inventory), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to inventory_items_path(@inventory), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_inventory
      @inventory = Inventory.find(params[:inventory_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @inventory.items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :quantity, :price, :inventory_id)
    end
end
