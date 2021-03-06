class CampsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  helper_method :sort_column, :sort_direction

  def index
    @camps = Camp.where("starting_date >= ?", Chronic.parse('yesterday')).order(starting_date: :asc)
  end

  def adminview
    @camps = Camp.order(starting_date: :desc)
  end

  def show
    @camp = Camp.find(params[:id])
    @camper = Camper.new
  end

  def reports
    @camp = Camp.find(camp_id)
    @campers = @camp.campers.order(sort_column + " " + sort_direction)
    @camps = Camp.all.order(starting_date: :asc)
    respond_to do |format|
      format.html
      format.csv {send_data @campers.to_csv, filename: "#{@camp.name}_as_of_#{DateTime.now.strftime "%Y-%m-%d_%H:%M:%S"}.csv"}
      #format.xls {send_data @campers.to_csv(col_sep: "\t"), filename: "#{@camp.name}_as_of_#{DateTime.now.strftime "%Y-%m-%d_%H:%M:%S"}.xls"}
    end
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    if @camp.valid?
      # @camp.starting_date = Chronic.parse(params[:camp][:starting_date])
      # @camp.ending_date = Chronic.parse(params[:camp][:ending_date])
      @camp.name = params[:camp][:name]
      @camp.location_name = capitalize_each_word(params[:camp][:location_name])
      @camp.city = capitalize_each_word(params[:camp][:city])
      @camp.save!
      segment_id = MailingList.new_camp_segment(@camp)
      @camp.list_id = segment_id
      @camp.save!
      flash[:alert] = "#{@camp.name} has been created successfully."
      redirect_to @camp
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
    params.require(:camp).permit(:name, :price, :description, :starting_date, :ending_date, :location_name, :location_street_one, :location_street_two, :city, :state, :zipcode)
  end

  def capitalize_each_word(form_string)
    result_array = []
    form_string.split(' ').each do |word|
      result_array.push(word.capitalize)
    end
    return result_array.join(' ')
  end

  def camp_id
    params[:id] ||= Camp.last.id
  end

  def sort_column
    params[:sort] ||= "age"
    %w[age position experience].include?(params[:sort]) ? params[:sort] : "age"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  # Method to increase remaining slots when total slots is updated

end
