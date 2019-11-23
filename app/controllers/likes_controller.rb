class LikesController < ApplicationController
  before_action :set_answer, only: %i(create)

  def create 
    @like = @answer.likes&.find_by(user: current_user)
    if @like
      @like.destroy
      return head :ok 
    else   
      @like = @answer.likes.build(user: current_user)
      if @like.save
        return head :ok 
      else  
        head :ng 
      end
    end 
  end 

  private 
    def set_answer 
        @answer = Answer.find(params[:answer_id])
    end 
end
