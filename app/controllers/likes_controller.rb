class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @answer = Answer.find(params[:answer_id])
    unless @answer.iine?(current_user)
      @answer.iine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js 
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id]).answer
    if @ansewer.iine?(current_user)
      @answer.uniine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end 
  end
end
