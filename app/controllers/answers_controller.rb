class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id
      respond_to do |format|
        if @answer.save
          format.js { render :answer }
          format.html { redirect_to @answer, notice: '完了しました'}
        end 
      end 
  end  
  
  def destroy 
    @answer = Answer.find(params[:id])
    if @answer.destroy
      render :answer
    end
  end

  private 
    def answer_params
      params.require(:answer).permit(:content, :question_id, :user_id)
    end
end 
