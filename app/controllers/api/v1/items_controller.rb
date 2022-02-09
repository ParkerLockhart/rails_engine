class Api::V1::ItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end 

  def not_found
    respond_with '{"error": "not_found"}', status: :not_found
  end
end
