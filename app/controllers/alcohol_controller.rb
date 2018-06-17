class AlcoholController < ApplicationController
  include AlcoholControllerHelper

  def index
    alcohols = Alcohol.all

    render json: { alcohols: alcohols, total: alcohols.count }.to_json
  end

  def create
    @alcohol = Alcohol.create(alcohol_params)

    alcohol = create_alcohol(@alcohol)

    if alcohol[:created]
      render json: alcohol, status: :created
    else
      render json: alcohol, status: :unprocessable_entity
    end
  end

  private

  def alcohol_params
    params.permit(:name, :vv)
  end
end
