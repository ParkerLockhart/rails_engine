class Api::V1::MerchantSearchController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    render json: MerchantSerializer.new(Merchant.name_search_single(params[:name]))
  end

  def not_found
    render json: "Error", status: :not_found
  end
end
