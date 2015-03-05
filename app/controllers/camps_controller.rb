class CampsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @camps = Camps.where("date_time > ?", DateTime.now).order(date_time: :asc)
  end

  def adminview
    @camps = Camp.order(date_time: :desc)
  end

  def show
    @camp = Camp.find(params[:id])
    @camper = Camper.new
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    if @camp.valid?
      @camp.date_time = Chronic.parse(params[:camp][:date_time])
      @camp.name = capitalize_each_word(params[:camp][:name])
      @camp.location_name = capitalize_each_word(params[:camp][:location_name])
      @camp.city = capitalize_each_word(params[:camp][:city])
      @camp.remaining_spots = @camp.total_spots
      @camp.save!
      flash[:alert] = "#{@camp.name} has been created successfully."
      redirect_to camps_path
    else
      render :new
    end
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def update
    @camp = Camp.find(params[:id])
    @camp.update(camp_params)
    if @camp.valid?
      @camp.save!
      flash[:alert] = "#{@camp.name} has been updated successfully."
      redirect_to camps_path
    else
      render :new
    end
  end

  def destroy
    @camp = Camp.find(params[:id])
    flash[:alert] = "#{@camp.name} has been successfully deleted."
    @camp.destroy!
    redirect_to camps_path
  end

  private
  def camp_params
    params.require(:camp).permit(:name, :price, :description, :date_time, :location_name, :location_street_one, :location_street_two, :city, :state, :zipcode, :total_spots)
  end

  def capitalize_each_word(form_string)
    result_array = []
    form_string.split(' ').each do |word|
      result_array.push(word.capitalize)
    end
    return result_array.join(' ')
  end

  # Method to increase remaining slots when total slots is updated

end
