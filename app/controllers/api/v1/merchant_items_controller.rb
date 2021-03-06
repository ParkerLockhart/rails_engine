class Api::V1::MerchantItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: ItemSerializer.new(merchant.items)
  end

  def not_found
    render json: "Error", status: :not_found
  end
end
