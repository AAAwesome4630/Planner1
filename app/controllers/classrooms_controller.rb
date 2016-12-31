class ClassroomsController < ApplicationController
  
  def index
    @classrooms = Classroom.all.order('numberOfStudents DESC')
    @classrooms = @classrooms.search(params[:search]) if params[:search].present?
    redirect_to find_path
    
  end
  

  def new
    @classroom = current_teacher.classrooms.build
  end

  def create
    @classroom = current_teacher.classroom.build(classroom_params)
    @classroom.teacher_id = current_teacher.id
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to "", notice: 'classroom was successfully created.' }
      else
        format.html { redirect_to "", notice: 'error not created' }
      end
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :subject)
  end
end