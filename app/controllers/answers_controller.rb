class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params, user: current_user)
    respond_to do |format|
      if @answer.save
        format.js { render :answer }
        format.html { redirect_to @answer, notice: '完了しました'}
      else  
        format.js { head:ng }
        format.html { render :new }
      end 
    end 
  end  
  
  def destroy 
    @answer = Answer.find(params[:id])
    redirect_to answers_path 
  end

  private 
    def answer_params
      params.require(:answer).permit(:content, :question_id, :user_id)
    end
end 
