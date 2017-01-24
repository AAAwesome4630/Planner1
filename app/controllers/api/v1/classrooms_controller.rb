module Api
  module V1
    
    class ClassroomsController < ApplicationController
      
       respond_to :html, :xml, :json
       
      def index 
        respond_with Classroom.all
      end
      
      def show
        respond_with Classroom.all
      end
    end
  end
end