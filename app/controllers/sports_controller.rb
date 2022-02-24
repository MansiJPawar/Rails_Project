class SportsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]

  before_action :set_sport, only: %i[ show edit update destroy ]

  # GET /sports or /sports.json
  def index
    ContactMailerJob.perform_later 1,2,3
    @sports = Sport.all
  end

  # GET /sports/1 or /sports/1.json
  def show
  end

  # GET /sports/new
  def new
    @sport = Sport.new
  end

  # GET /sports/1/edit
  def edit
  end

  # POST /sports or /sports.json
  def create
    @sport = Sport.new(sport_params)
    @sport.user = current_user

    respond_to do |format|
      if @sport.save
        #mailer 
        # SportMailer.with(user: current_user,post: @sport).post_created.deliver_later
        SportMailer.post_created.deliver_later

        format.html { redirect_to sport_url(@sport), notice: "Sport was successfully created." }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports/1 or /sports/1.json
  def update
    respond_to do |format|
      if @sport.update(sport_params)
        format.html { redirect_to sport_url(@sport), notice: "Sport was successfully updated." }
        format.json { render :show, status: :ok, location: @sport }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports/1 or /sports/1.json
  def destroy
    @sport.destroy

    respond_to do |format|
      format.html { redirect_to sports_url, notice: "Sport was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #server side dataTable
  def get_dataset
    render json: { sports: Sport.page(params[:page]).per(per_page) }
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sport_params
      params.require(:sport).permit(:sport_name, :sport_equipement)
    end
end
