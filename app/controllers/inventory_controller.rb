class InventoryController < ApplicationController
  before_action :get_location
  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventory or /inventory.json
  def index
    @inventory = @location.inventory
  end

  # GET /inventory/1 or /inventory/1.json
  def show
  end

  # GET /inventory/new
  def new
    @location
    @inventory = @location.build_inventory
  end

  # GET /inventory/1/edit
  def edit
  end

  # POST /inventory or /inventory.json
  def create
    @inventory = @location.build_inventory(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to location_path(@location), notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory/1 or /inventory/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_path(@location), notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory/1 or /inventory/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventory_index_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_location
      @location = Location.find(params[:location_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = @location.inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:name, :location_id)
    end
end
