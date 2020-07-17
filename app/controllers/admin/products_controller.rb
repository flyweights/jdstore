class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product successfully created'
      redirect_to admin_products_path
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
