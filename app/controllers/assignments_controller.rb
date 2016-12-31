class AssignmentsController < ApplicationController

  def create
    @assignment = Assignment.new(assignment_params)
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to "", notice: 'Assignment was successfully created.' }
      else
        format.html { redirect_to "", notice: 'error not created' }
      end
    end
  end
  def assignment_params
      params.require(:assignment).permit(:classroom_id, :due_date, :name)
  end
  
end