class Notifier < ActionMailer::Base  
  def subscriber_announcement(email, message)
    recipients email
    from "ritzylunchwv@gmail.com"
    subject "The Ritzy Announcements"
    body( :message => message )
  end
end