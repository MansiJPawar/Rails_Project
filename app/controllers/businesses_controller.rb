class BusinessesController < ApplicationController
  def index
  end

  private

    def business_params
      params.require(:business).permit(:name, :address, :logo)
    end
end
