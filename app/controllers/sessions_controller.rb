class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      current_user = user
      sign_in user
      if user.admin?
        redirect_to users_path
      else
        redirect_to posts_path
      end

    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end
end
