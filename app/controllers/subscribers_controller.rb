class SubscribersController < ApplicationController
  def create
    redirect_to :back and return if is_spam?

    subscriber = Subscriber.new(:email => params[:email])

    if Subscriber.exists?(:email => subscriber.email)
      error "You've already signed up!"
      redirect_to :back and return
    end

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