class SubscribersController < ApplicationController
  def create
    redirect_to :back and return if is_spam?

    subscriber = Subscriber.new(:email => params[:email])

    if subscriber.save
      notice "Thanks for signing up!"
    else
      error "Email is required to sign up for announcements."
    end

    redirect_to :back
  end

protected
  def is_spam?
    params[:beware].present?
  end
end