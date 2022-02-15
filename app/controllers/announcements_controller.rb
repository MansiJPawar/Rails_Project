class AnnouncementsController < ApplicationController
  before_action :get_sport
  before_action :set_announcement, only: %i[ show edit update destroy ]

  # GET /announcements or /announcements.json
  def index
    @announcements = @sport.announcements
  end

  # GET /announcements/1 or /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = @sport.announcements.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements or /announcements.json
  def create
    @announcement = @sport.announcements.new(announcement_params)
    
    respond_to do |format|
      if @announcement.save
        AnnounceMailer.Announcement_created.deliver_later
        format.html { redirect_to sport_announcements_path(@sport), notice: "Announcement was successfully created." }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1 or /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to sport_announcement_path(@sport), notice: "Announcement was successfully updated." }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1 or /announcements/1.json
  def destroy
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to sport_announcements_path(@sport), notice: "Announcement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = @sport.announcements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:announcement_title, :content, :user_id, :sport_name, :sport_id)
    end
    
    def get_sport
      @sport = Sport.find(params[:sport_id])
    end

end
