class QuestionsController < ApplicationController
  before_action :set_question, only: %i(show edit update destroy) 

  def index
    @questions = Question.page(params[:page]).per(5)
  end

  def show
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create 
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, notice: "質問を投稿しました。"
    else
      render :new
    end
  end

  def edit 
  end

  def update 
    @question.update(question_params)
    redirect_to questions_path, notice: "質問を更新しました。"
  end

  def destroy 
    @question.destroy
    redirect_to questions_path, notice: "質問を削除しました。"
  end

    private
    
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :body)
    end
    
end
