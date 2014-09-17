class HomeController < ApplicationController

  def welcome
    @clinics = Clinic.where("date_time > ?", DateTime.now).where("remaining_spots > ?", 0).order(date_time: :asc).limit(3)
  end

  def about

  end

  def faq

  end

  def contact

  end

end
