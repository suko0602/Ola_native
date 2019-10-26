class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_back(fallback_location: root_path)
    else  
      redirect_back(fallback_location: root_path)
    end
  end  
  
  def destroy 
  end

  private 

  def answer_params
    params.require(:answer).permit(:content)
  end
end 
