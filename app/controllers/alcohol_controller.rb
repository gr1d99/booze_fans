class AlcoholController < ApplicationController
  include AlcoholControllerHelper

  def create
    @alcohol = Alcohol.create(alcohol_params)

    response = create_alcohol(@alcohol)
    render json: response

  end

  private

  def alcohol_params
    params.permit(:name, :vv)
  end
end
