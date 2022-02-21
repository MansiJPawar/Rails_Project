class AnnouncementsController < ApplicationController
before_action :set_annoucement, only: [:update, :show, :destroy]
   
  # GET /annoucements
  def index
    @annoucements = Annoucement.all
    render json: @annoucements
  end
     
  # GET /annoucements/1
  def show
    render json: @annoucement
  end
     
  # POST /annoucements
  def create
    @annoucement = Annoucement.new(annoucement_params)
     
      if @annoucement.save
        render json: @annoucement, status: :created, location: @annoucement
      else
        render json: @annoucement.errors, status: :unprocessable_entity
      end
  end
     
  # PATCH/PUT /annoucements/1
  def update
    if @annoucement.update(annoucement_params)
      render json: @annoucement
    else
      render json: @annoucement.errors, status: :unprocessable_entity
    end
  end
     
  # DELETE /annoucements/1
  def destroy
    @annoucement.destroy
  end
     
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annoucement
      @annoucement = Annoucement.find(params[:id])
    end
     
    # Only allow a trusted parameter "white list" through.
    def annoucement_params
      params.require(:annoucement).permit(:subject, :notice, :sport_id)
    end
end
