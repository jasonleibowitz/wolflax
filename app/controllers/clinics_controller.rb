class ClinicsController < ApplicationController

  def index
    @clinics = Clinic.all
  end

  def new
    @clinic = Clinic.new
  end

  def create
    clinic = Clinic.new(clinic_params)
    clinic.remaining_spots = clinic.total_spots
    clinic.save!
    redirect_to clinics_path
  end

  def edit

  end

  def update

  end

  def destroy
    @clinic = Clinic.find(params[:id])
    flash[:alert] = "#{@clinic.name} has been successfully"
    @clinic.destroy!
    redirect_to clinics_path
  end

  private
  def clinic_params
    params.require(:clinic).permit(:name, :price, :date_time, :location_name, :location_street_one, :location_street_two, :city, :state, :zipcode, :total_spots)
  end

end
