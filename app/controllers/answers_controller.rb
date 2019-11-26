class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.build(content: answer_params[:content], question: @question)
    respond_to do |format|
      if @answer.save
        format.js { render :answer }
        format.html { redirect_to @answer, notice: '完了しました'}
      else  
        format.js { head :ng }
        format.html { render :new }
      end 
    end 
  end  
  
  def destroy 
    @answer = Answer.find(params[:id])
    @answer.destroy 
    redirect_to questions_path, notice: "削除しました。"
  end
  
  private 

    def answer_params
      params.require(:answer).permit(:content)
    end
end 
