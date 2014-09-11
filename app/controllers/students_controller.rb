class StudentsController < ApplicationController

  def index
    @clinic = Clinic.find(params[:clinic_id])
    @students = @clinic.students
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @clinic = Clinic.find(params[:clinic_id])
    @student = @clinic.students.build
    if @student.clinic.remaining_spots == 0
      flash[:alert] = "This clinic is currently sold out."
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save_with_payment
      @student.clinic.update_attendance
      redirect_to @student.clinic, :notice => "Thank you for your purchase. We look forward to seeing you!"
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :email, :stripe_card_token, :amount, :clinic_id)
  end
  def clinic_id
    params.permit(:clinic)
  end

end
