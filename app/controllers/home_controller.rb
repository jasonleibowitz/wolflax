class HomeController < ApplicationController

  def welcome
    @camps = Camp.where("starting_date > ?", Date.today).order(starting_date: :asc).limit(4)
    @upcoming_camps = Camp.where("starting_date > ?", Date.today)
  end

  def about

  end

  def jordan

  end

  def staff

  end

  def faq

  end

  def contact

  end

  def privacy_policy

  end

end
