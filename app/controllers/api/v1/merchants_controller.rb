class Api::V1::MerchantsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def not_found
    render json: "Error", status: :not_found
  end
end
