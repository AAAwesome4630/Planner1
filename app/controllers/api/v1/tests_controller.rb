class TestsController < ApplicationController

  def create
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save
        format.html { redirect_to "", notice: 'Test was successfully created.' }
      else
        format.html { redirect_to "", notice: 'error not created' }
      end
    end
  end
  def test_params
      params.require(:test).permit(:classroom_id, :date, :topic)
  end
  
end