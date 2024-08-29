class OrdersController < ApplicationController
  before_action :set_order, only: [ :show ]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/:id
  def show
    # @order is set by the set_order before_action
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: "Order not found."
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:product_id, :quantity, :user_id, :status) # Adjust attributes as needed
  end
end
