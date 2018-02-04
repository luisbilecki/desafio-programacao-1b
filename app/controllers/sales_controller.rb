class SalesController < ApplicationController
  before_action :set_sale, only: [:edit, :update, :destroy]
  def index
    @sales = Sale.all.page(params[:page]).per(5)
  end

  def new
    @sale = Sale.new
  end

  def update
    if @sale.update(params_sale)
      redirect_to sales_path,
        notice: t('messages.updated', item: Sale.model_name.human)
    else
      render :edit
    end
  end

  def edit
  end

  def create
    @sale = Sale.new(params_sale)

    if @sale.save
      redirect_to sales_path,
        notice: t('messages.inserted', item: Sale.model_name.human)
    else
      render :new
    end
  end

  def destroy
    old_sale = @sale

    if @sale.destroy
      redirect_to sales_path,
        notice: t('messages.destroyed', item: Sale.model_name.human,
                   name: old_sale.description)
    else
      render :index
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def params_sale
    params.require(:sale).permit(:buyer, :description, :price, :quantity, :address, :supplier)
  end

end
