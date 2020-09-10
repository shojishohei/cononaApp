class SessionsController < ApplicationController
  
  def home
  end
  
  def new
    
  end
  
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # if user.activated?
        
        log_in user
        # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # redirect_back_or user
          redirect_to root_url
      else
        # UserMailer.sendmail(user).deliver_now
        # message  = "Account not activated. "
        # message += "Check your email for the activation link."
        # flash[:warning] = message
        # redirect_to root_url
    #   end
    # else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
