class LikesController < ApplicationController
  before_action :set_answer, only: %i(create)

  def create 
    @like = @answer.likes&.find_by(answer_id: params[:answer_id])
    if @like
      @like.destroy
      head :ok 
    else   
      @like = @answer.likes.build(user: current_user)
      return head :ok if @like.save
      head :unprocessable_entity
    end 
  end 
 
  
  private 

    def set_answer 
      @answer = Answer.find(params[:answer_id])
    end 

end
