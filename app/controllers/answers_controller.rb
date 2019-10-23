class AnswersController < ApplicationController
  def create
    @answer = question.answers.build(answer_params)
    if @answer.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: question_path)
    else 
    　flash[:danger] = "コメント失敗しました"
      redirect_back(fallback_location: question_path)
    end
  end  
  
  def destroy 
    @answer = question.answers.find(params[:id])
    @answer.destroy
    redirect_back(fallback_location: question_path)
  end

  private 
  def answer_params
    params.require(:answer).permit(:content)
  end

end 
