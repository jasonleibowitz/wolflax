class CampersController < ApplicationController

  def index
    @camp = Camp.find(params[:camp_id])
    @campers = @camp.campers
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camps = Camp.all
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @camps = Camp.all
    if @camper.save_with_payment
      redirect_to root_path, :notice => "Thank you for your purchase. We look forward to seeing you!"
    else
      render :new
    end
  end

  private
  def camper_params
    params.require(:camper).permit(:first_name, :last_name, :age, :dob, :street_address_one, :street_address_two, :city, :state, :zipcode, :team_name, :position, :experience, :mobile_phone, :email, :insurance_company_name, :insurance_policy_number, :insurance_policyholder, :mother_first_name, :mother_last_name, :mother_email, :mother_phone, :father_first_name, :father_last_name, :father_email, :father_phone, :waiver_signed, :camp_id, :school, :stripe_card_token)
  end
  def camp_id
    params.permit(:camp)
  end

end
