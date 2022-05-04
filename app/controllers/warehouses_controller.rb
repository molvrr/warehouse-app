class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse = Warehouse.new(params.require(:warehouse).permit(:name, :description, :code, :address, :city, :cep, :area))
    return redirect_to root_path if warehouse.save

    render :new, status: :unprocessable_entity
  end
end
