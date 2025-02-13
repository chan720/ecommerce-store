class ProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product), notice: "Product was successfully created."
    else
      render :new
    end
  end


  def edit
    @product = Product.find(params[:id])
    if cannot?(:manage, @product)
      redirect_to root_path, alert: "You are not authorized to edit products."
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :stock)
  end
end
