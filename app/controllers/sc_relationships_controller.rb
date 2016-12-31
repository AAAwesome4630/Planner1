class ScRelationshipsController < ApplicationController
  before_filter :authenticate_student!


  def create
    @sc_relationship = ScRelationship.new(sc_params)
    @sc_relationship.student_id = current_student.id
    respond_to do |format|
      if @sc_relationship.save
        format.html { redirect_to "", notice: 'Relationship was successfully created.' }
      else
        format.html { redirect_to "", notice: 'error not created' }
      end
    end
  end
  def sc_params
      params.require(:sc_relationship).permit(:classroom_id)
  end
  
end
