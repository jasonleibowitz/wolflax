class CampersController < ApplicationController

  def index
    @camp = Camp.find(params[:camp_id])
    @campers = @camp.campers
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camp = Camp.find(params[:camp_id])
    @camper = @camp.campers.build
  end

  def create
    @camper = Camper.new(camper_params)
    if @camper.save_with_payment
      redirect_to @camper.camp, :notice => "Thank you for your purchase. We look forward to seeing you!"
    else
      render :new
    end
  end

  private
  def camper_params
    params.require(:camper).permit(:name, :email, :stripe_card_token, :amount, :camp_id, :age, :position)
  end
  def camp_id
    params.permit(:camp)
  end

end
