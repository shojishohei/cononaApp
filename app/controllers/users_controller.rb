class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @beforeposts = @user.beforeposts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def home

  end
  
  def create

    @user = User.new(user_params)
    if @user.save
      # UserMailer.account_activation(@user).deliver_now
      # flash[:info] = "Please check your email to activate your account."
      log_in @user
      redirect_to root_url
      
      # log_in @user
      # flash[:success] = "Welcome to the Corona App!"
      # redirect_to root_path
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
