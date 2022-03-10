class Api::V1::AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_achievement, only: [:update, :show, :destroy]

  #GET /api/v1/achievements
  def index
    @achievements = Achievement.all(page).per(per_page)
    render_success 200, true, 'achievement fetched successfully', @achievements.as_json
  end
  
  #GET /api/v1/achievements/:id
  def show
    render_success 200, true, 'achievement fetched successfully', @achievement.as_json
  end
  
  #POST /api/v1/achievements
  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      render_success 200, true, 'achievement created successfully', @achievement.as_json
    else
      return_error 500, false,'unprocessable_entity'
      if @achievement.errors
        errors =  @achievement.errors.full_messages.join(", ")
      else
        errors = 'achievement creation failed'
      end
      return_error 500, false,'Invalid'
    end
  end
  
  # PATCH/PUT /api/v1/achievements/:id
  def update
    if @achievement.update(achievement_params)
      render_success 200, true, 'achievement updated successfully', @achievement.as_json
    else
      return_error 500, false,'unprocessable_entity'
    end
  end
  
  # DELETE /api/v1/achievements/:id
  def destroy
    @achievement.destroy
    render_success 200, true, 'Achievement deleted successfully', {}
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def achievement_params
      params.require(:achievement).permit(:title, :detail, :user_id)
    end
end
