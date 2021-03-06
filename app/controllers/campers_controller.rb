class CampersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @camp = Camp.find(params[:camp_id])
    @campers = @camp.campers
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camps = Camp.upcoming.order(starting_date: :asc)
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @camper.dob = Chronic.parse(params[:camper][:dob])
    @camps = Camp.all
    if @camper.save_with_payment
      if @camper.charge_state == "complete"
        MailingList.subscribe(@camper)
        redirect_to success_path(:id => @camper.camp.id), :notice => "Thank you for your purchase. We look forward to seeing you!"
      else
        @camper.delete
        redirect_to new_camper_path, :alert => "Unfortunately we were unable to process your payment. #{@camper.stripe_error_message}. Please contact your credit card company and then try registering again."
      end
    else
      render :new
    end
  end

  def edit
    @camper = Camper.find(params[:id])
    @camps = Camp.upcoming.order(starting_date: :asc)
  end

  def update
    @camper = Camper.find(params[:id])
    @camps = Camp.all
    if @camper.camp_id != camper_params[:camp_id]
      MailingList.update_camp_segment(@camper, camper_params[:camp_id])
    end
    @camper.update(camper_params)
    if @camper.valid?
      redirect_to camps_reports_path, :notice => "#{@camper.first_name} #{@camper.last_name} has been updated."
    else
      render :edit
    end
  end

  def destroy
    @camper = Camper.find(params[:id])
    @camper.destroy!
    redirect_to camps_reports_path, :notice => "Refund successfully processed."
  end

  def success
    @camp = Camp.find(params[:id])
  end

  private
  def camper_params
    params.require(:camper).permit(:first_name, :last_name, :age, :dob, :street_address_one, :street_address_two, :city, :state, :zipcode, :team_name, :position, :experience, :mobile_phone, :email, :insurance_company_name, :insurance_policy_number, :insurance_policyholder, :mother_first_name, :mother_last_name, :mother_email, :mother_phone, :father_first_name, :father_last_name, :father_email, :father_phone, :waiver_signed, :camp_id, :school, :grade, :referral, :stripe_card_token)
  end
  def camp_id
    params.permit(:camp)
  end

end
