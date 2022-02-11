class Api::V1::ItemSearchController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: ItemSerializer.new(Item.name_search(params[:name]))
  end

  def not_found
    render json: "Error", status: :not_found
  end
end
