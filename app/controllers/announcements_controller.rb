class AnnouncementsController < ApplicationController
  caches_page :index
  
  def index
    @announcements = Announcement.all(:order => 'date DESC')
  end
  
  def show
    @announcement = Announcement.find(params[:id])
  end
end