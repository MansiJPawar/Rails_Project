class OffersController < ApplicationController
  def index
  end

  private

    def offer_params
      params.require(:business).permit(:title, :description, :coupon, :business_id)
    end
end
