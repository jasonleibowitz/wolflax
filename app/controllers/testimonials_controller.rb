class TestimonialsController < ApplicationController
  before_action :authenticate_user!

  def index
    @testimonials = Testimonial.all
  end

  def show
    @testimonial = Testimonial.find(param[:id])
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.valid?
      @testimonial.save!
      redirect_to testimonials_path
    else
      render :new
    end
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    @testimonial.update(testimonial_params)
    redirect_to testimonials_path
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy!
    redirect_to root_path
  end

  private
  def testimonial_params
    params.require(:testimonial).permit(:quote, :author)
  end

end
