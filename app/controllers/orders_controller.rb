class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :pay, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.unpaid.latest
  end
  
  # GET /orders/historic
  # GET /orders/historic.json
  def historic
    @orders = Order.paid.latest
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
  
  # GET /orders/1/pay
  def pay
    @order.pay
    redirect_to orders_url, notice: 'La orden fue pagada.'
  end  

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    
    redirect_path = @order.paid? ? historic_orders_path : orders_path

    respond_to do |format|
      if @order.save
        format.html { redirect_to redirect_path, notice: 'La orden fue creada.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        redirect_path = @order.paid? ? historic_orders_path : orders_path
        format.html { redirect_to redirect_path, notice: 'La orden fue actualizada.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'La orden fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:Order, :total_cost, :quantity, :customer_id, :product_id, :paid)
    end
end
