class Api::V1::ItemMerchantController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    item = Item.find(params[:item_id])
    render json: MerchantSerializer.new(Merchant.find(item.merchant_id))
  end

  def not_found
    render json: "Error", status: :not_found
  end

end
