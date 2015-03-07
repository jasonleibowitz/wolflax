class HomeController < ApplicationController

  def welcome
    @camps = Camp.where("starting_date > ?", Date.today).order(starting_date: :asc).limit(3)
  end

  def about

  end

  def faq

  end

  def contact

  end

end
