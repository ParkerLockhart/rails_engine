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
    else
      render json: item.errors, status: :internal_server_error
    end
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(Item.find(params[:id]))
    else
      render json: item.errors, status: :not_found
    end
  end

  def not_found
    render json: "Error", status: :not_found
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

end
