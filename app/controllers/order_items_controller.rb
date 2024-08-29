class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = current_user.order_items.new(order_item_params)
    if @order_item.save
      redirect_to order_items_path, notice: "Order item successfully created."
    else
      render :new
    end
  end

  def index
    # @order_items = current_user.order_items
    @order_items = current_user.order_items.includes(:product)

    # Calculate total bill
    @total_bill = @order_items.sum { |item| item.quantity * item.product.price }
  end

  def show
    @order_item = OrderItem.find(params[:id])
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
