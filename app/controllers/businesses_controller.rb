class BusinessesController < ApplicationController
  before_action :set_business, only: ['show', 'edit', 'update', 'destroy']

  def index
    @businesses = Business.all
    respond_to do |format|
      format.html
      format.csv { send_data @businesses.to_csv(['name', 'address', 'start_date', 'finish_date']) }
    end
  end
 
  def show
  end

  def new
    @business = Business.new
  end

  def edit
  end

  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to business_url(@business), notice: "business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to business_url(@business), notice: "business was successfully updated." }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy

    respond_to do |format|
      format.html { redirect_to businesses_url, notice: "business was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def fetch_businesses
    render json: { businesses: Business.all} 
    search_string = []
    filter_query = ''

    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
      businesses = businesses.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%")
    end
  end

  private

    def set_business
      @business = Business.find(params[:id])
    end
 
    def business_params
      params.require(:business).permit(:name, :address, :logo, :start_date, :finish_date)
    end
end