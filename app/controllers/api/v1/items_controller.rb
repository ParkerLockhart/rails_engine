class Api::V1::ItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(Item.find(item.id)), status: :created
    end 
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  def not_found
    respond_with '{"error": "not_found"}', status: :not_found
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

end
