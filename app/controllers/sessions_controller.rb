class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#осуществить вход и переадресовать на страницу профиля
  		log_in user
      params[:session][:remember_me] =='1' ? remember(user) : forget(user)
  		redirect_to user
  	else
  		#создать сообщение об ошибке
  		flash.now[:danger] = 'Invalid email/password'
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
