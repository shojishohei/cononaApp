class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @beforepost  = current_user.beforeposts.build
    end
  end

  def create
    
  end  
  
  def new
    @user = User.new
  end

  def show
  
  end

end
