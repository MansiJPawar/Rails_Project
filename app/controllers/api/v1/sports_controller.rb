class Api::V1::SportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sport, only: [:update, :show, :destroy]
   
  #GET /api/v1/sports
  def index
    @sports = Sport.all(page).per(per_page)
    render_success 200, true, 'Sports fetched successfully', @sports.as_json 
  end
   
  #GET /api/v1/sports/:id
  def show
    render_success 200, true, 'Sport fetched successfully', @sport.as_json
  end
   
  #POST /api/v1/sports
  def create
    @sport = Sport.new(sport_params)
      if @sport.save && current_user.admin?
        render_success 200, true, 'Sport created successfully', @sport.as_json 
      else
        if @sport.errors
          errors = @sport.errors.full_messages.join(", ")
        else
          errors = 'Sport creation failed'
        end
          return_error 500, false, 'only admin can create sport'
      end
  end
   
  # PATCH/PUT /api/v1/sports/:id
  def update
   if @sport.update(sport_params) && current_user.admin?
     render_success 200, true, 'Sport updated successfully', @sport.as_json
   else
    if @sport.errors
      errors = @sport.errors.full_messages.join(", ")
    else
      errors = 'Sport update failed'
    end
      return_error 500, false, 'Only admin can update sport'
   end
  end
   
  #DELETE /api/v1/sports/:id
  def destroy
    if current_user.admin?
      @sport.destroy
      render_success 200, true, 'Sport deleted successfully', {}
    else
      return_error 500, false, 'Only admin can delete sport'
    end
  end
   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    end
   
    # Only allow a trusted parameter "white list" through.
    def sport_params
      params.require(:sport).permit(:name,:equipement)
    end

    def page
      @page ||= params[:page] || 1
    end
  
    def per_pag
      @per_page ||= params[:per_page] || 5
    end
end
