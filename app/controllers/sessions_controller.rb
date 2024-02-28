class SessionsController < ApplicationController
  def new
  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]
    response = AuthenticationService.new.authenticate(username, password)
    if response['result']
      @user = User.find_or_create_by(username: username, user_id: response['user_id'])
      session[:user_id] = @user.id
      redirect_to show_path, notice:  'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully'
  end
end
