class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_username(params[:session][:username].downcase)
    if @user && @user.password == params[:session][:password]
      redirect_to userpage_path(:username => @user.username)
    else
      flash[:notice] = 'Invalid Username or Password'
      redirect_to login_path
    end
  end
  def destroy
    session.destroy()
    redirect_to users_path
  end
end
