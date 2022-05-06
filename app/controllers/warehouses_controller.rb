class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update]

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(allowed_params)
    return redirect_to root_path, notice: 'Galpão cadastrado com sucesso.' if @warehouse.save

    flash.now[:notice] = 'Galpão não cadastrado.'
    render 'new'
  end

  def edit; end

  def update
    return redirect_to @warehouse, notice: 'Galpão atualizado com sucesso' if @warehouse.update(allowed_params)

    flash.now[:notice] = 'Não foi possível atualizar o galpão'
    render 'edit'
  end

  private

  def allowed_params
    params.require(:warehouse).permit(:name, :description, :code,
                                      :address, :city, :cep, :area)
  end

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end
