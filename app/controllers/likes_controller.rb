class LikesController < ApplicationController
  before_action :set_like, only: %(:create)
  before_action :set_answer, only: %(:create)

  def create
    if @like 
      @like.destroy
      return head: :ok 
    end  
  
    if @like.save
      head: :ok 
    else  
      head: :ng 
    end 
  end 

  private 
 
  def set_like 
    @like = Like.find_or_initialie_by(user: current_user, answer: @answer)
  end 

  def set_answer 
    @answer = Answer.find(params[:answer_id])
  end 
end
