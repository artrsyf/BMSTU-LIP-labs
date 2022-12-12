class SessionsController < ApplicationController
  before_action :if_not_authenticate, only: [:new, :create]
  before_action :if_authenticate, only: %i[destroy]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password]) # user is not nil
      sign_in(@user)
      flash[:success] = "Welcome, log in success"
      redirect_to root_path
    else
      flash[:warning] = "Incorrect email and password"
      redirect_to sessions_path
    end
  end

  def destroy
    sign_out
    flash[:success] = "Successfully loged out"
    redirect_to root_path
  end
end
