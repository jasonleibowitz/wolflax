class ClinicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @clinics = Clinic.where("date_time > ?", DateTime.now).order(date_time: :asc)
  end

  def adminview
    @clinics = Clinic.order(date_time: :desc)
  end

  def show
    @clinic = Clinic.find(params[:id])
    @student = Student.new
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new(clinic_params)
    if @clinic.valid?
      @clinic.date_time = Chronic.parse(params[:clinic][:date_time])
      @clinic.remaining_spots = @clinic.total_spots
      @clinic.save!
      flash[:alert] = "#{@clinic.name} has been created successfully."
      redirect_to clinics_path
    else
      render :new
    end
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])
    @clinic.update(clinic_params)
    if @clinic.valid?
      @clinic.save!
      flash[:alert] = "#{@clinic.name} has been updated successfully."
      redirect_to clinics_path
    else
      render :new
    end
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    flash[:alert] = "#{@clinic.name} has been successfully"
    @clinic.destroy!
    redirect_to clinics_path
  end

  private
  def clinic_params
    params.require(:clinic).permit(:name, :price, :description, :date_time, :location_name, :location_street_one, :location_street_two, :city, :state, :zipcode, :total_spots)
  end

  # Method to increase remaining slots when total slots is updated

end
