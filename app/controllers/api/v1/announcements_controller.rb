class AnnouncementsController < ApplicationController
  
  respond_to :json, :html, :xml

  def index
    respond_with Announcement.all
  end
  
  def create
    respond_with Announcement.create()
  end
  
  def show
  end
  
  
end
