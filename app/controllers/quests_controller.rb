class QuestsController < ApplicationController
  def create
    @user = current_user
    @quest = @user.quests.create(params[:quest])
    redirect_to user_path(@user)
  end
  def index
    
  end
  
  def show
    @quest = Quest.find(params[:id])
    if params[:q] 
      @user = User.find_by_name(params[:q])
      @quest.users << @user
    end
     respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @quest }
    end
  end
  def add_user
  
  end
end
