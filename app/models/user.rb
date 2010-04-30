require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  
  acts_as_lookup [:first_name, :last_name], :default_text => :first
  
  validates_confirmation_of :password
  validates_presence_of :first_name, :last_name, :username, :password, :password_confirmation
  
private
  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end
  
  def self.login(login, password)
    hashed_password = hash_password(password || "")
    find(:first, :conditions => { :username => login, :hashed_password => hashed_password })
  end
  
protected
  def before_create
    self.hashed_password = self.class.hash_password(self.password)
  end
  
  def after_create
    @password = nil
  end

public  
  def try_to_login!
    self.class.login(self.username, self.password) or raise "Oooooooops! You've entered invalid credentials."
  end
  
  def name
    [self.first_name, self.last_name].compact.join(' ')
  end
end