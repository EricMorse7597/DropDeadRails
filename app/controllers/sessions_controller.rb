class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.nil?
      flash.now[:danger] = 'There is no user with that account, please signup'
      render 'new', status: :unprocessable_entity
    elsif user&.authenticate(params[:session][:password])
      reset_session
      log_in user
      flash[:success] = 'Welcome Back!'
      redirect_to user
    else
      flash.now[:danger] = 'Invalid password'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
