class AnnouncementsController < ApplicationController
  before_filter :authenticate_teacher!


  def create
    @announcement = Announcement.new(tf_params)
    respond_to do |format|
      if @announcement.save
        format.html { redirect_to "", notice: 'Announcement was successfully created.' }
      else
        format.html { redirect_to "", notice: 'error not created' }
      end
    end
  end
  def tf_params
      params.require(:announcement).permit(:classroom_id, :header, :content)
  end
  
end
