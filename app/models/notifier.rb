class Notifier < ActionMailer::Base  
  def subscriber_announcement(email, message)
    recipients email
    from "ritzylunchwv@gmail.com"
    subject "Announcements from The Ritzy!"
    body( :message => message )
  end
end