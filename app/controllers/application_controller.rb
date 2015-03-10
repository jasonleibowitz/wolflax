require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :setup_mcapi

  def setup_mcapi
    @mc = Mailchimp::API.new(ENV['MAILCHIMP-API-KEY'])
  end


  # def new

  # end

  # def create
  #   # Amount in cents
  #   @amount = 500

  #   customer = Stripe::Customer.create(
  #     :email => 'example@stripe.com',
  #     :cart => params[:stripeToken]
  #     )

  #   charge = Stripe::Charge.create(
  #     :customer => customer.id,
  #     :amount => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency => 'usd'
  #     )

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to charges_path
  # end

end
