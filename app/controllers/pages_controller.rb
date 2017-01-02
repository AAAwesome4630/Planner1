class PagesController < ApplicationController
  def index
  end

  def home
    
    if(student_signed_in?)
      
      @assignments = Assignment.all
      @tests = Test.all
      
      
      @srelationships = ScRelationship.all.where("student_id = ?", current_student.id )
      
      
      sclassrooms = Array.new
      
      for @relationship in @srelationships do
        sclassrooms.push(@relationship.classroom_id)
      end
      
      
      @sassignments = Assignment.where("classroom_id IN (?)", sclassrooms)
      @stests = Test.where("classroom_id IN (?)", sclassrooms)
      
      
      
      
      
      
        
      
    end
    

  end

  def find
    
    term = params[:q]
    @classrooms = Classroom.search(term)
    
  end

  def profile
  end
  
  def classroom
    
    if(Classroom.find_by_id(params[:id]))
      @classroom_id = params[:id]
      @classroom = Classroom.find_by_id(params[:id])
      @nOS = @classroom.numberOfStudents
      @teacher_id = @classroom.teacher_id
      @name = @classroom.name
      @subject = @classroom.subject
      
      if(teacher_signed_in?)
        if(current_teacher.id == @teacher_id)
          @tstatus = true
        else
          @tstatus = false
        end
      end
    

      
      
      @crelationships = ScRelationship.all.where("classroom_id = ?", Classroom.find_by_id(params[:id]).id )
      
      @t_filez = TFile.all.where("classroom_id = ?", Classroom.find_by_id(params[:id]).id)
      
      if(student_signed_in?)

        for relationship in @crelationships do
                       
            if(relationship.student_id == current_student.id)
              @status = true
            else
              @status = false

            end
        
        
        end
        
      end
      
    else
      redirect_to root_path, :notice => 'Classroom Does not exist!!!'
    end
    
    
    @sc_relationship = ScRelationship.new
    
    @assignment = Assignment.new
    
    @test = Test.new
    
    @t_file = TFile.new
    
    
      
    
  end
end
