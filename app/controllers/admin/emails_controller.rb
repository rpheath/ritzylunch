class Admin::EmailsController < ApplicationController
  def new
    render
  end

  def create
    message = params[:body]
    message.gsub!("\n", "<br />") if message.present?

    begin
      Subscriber.all.each do |subscriber|
        Notifier.deliver_subscriber_announcement(subscriber.email, message)
      end
      
      notice "Your email has been sent to #{Subscriber.count} subscriber(s)."
      redirect_to :back

    rescue Exception => e 
      error e.message
      redirect_to :back
    end
  end
end
