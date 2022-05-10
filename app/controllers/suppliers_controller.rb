class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update]

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    return redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso.' if @supplier.save

    flash.now[:notice] = 'Fornecedor não cadastrado.'
    render 'new'
  end

  def show; end

  def edit; end

  def update
    return redirect_to @supplier, notice: 'Fornecedor atualizado com sucesso.' if @supplier.update(supplier_params)

    flash.now[:notice] = 'Não foi possível atualizar o fornecedor.'
    render 'edit'
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:corporate_name, :trade_name,
                                     :state, :city, :registration_number, :email, :full_address, :phone_number)
  end
end
