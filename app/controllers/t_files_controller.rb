class TFilesController < ApplicationController
  before_filter :authenticate_teacher!


  def create
    @t_file = TFile.new(tf_params)
    respond_to do |format|
      if @t_file.save
        format.html { redirect_to "", notice: 'TFile was successfully created.' }
      else
        format.html { redirect_to "", notice: 'error not created' }
      end
    end
  end
  def tf_params
      params.require(:t_file).permit(:classroom_id, :name, :file)
  end
  
end
