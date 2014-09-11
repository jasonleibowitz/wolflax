class StudentsController < ApplicationController

  def create
    @student = Student.new(student_params)
    @clinic = Clinic.find(params[:student][:clinic])
    @student.clinic = @clinic
    # @student.save!
  end

  private
  def student_params
    params.require(:student).permit(:name, :email)
  end
  def clinic_id
    params.permit(:clinic)
  end

end
