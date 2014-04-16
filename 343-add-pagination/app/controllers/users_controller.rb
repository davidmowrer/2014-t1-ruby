class UsersController < ApplicationController
  before_action do
    @logged_in_user = User.find_by(id: session[:logged_in_user_id])
  end

  def index
    @users = User.order(:id)
    render :index and return
  end

  def new
    @user = User.new
    render :new and return
  end

  def create
    @user = User.new
    @user.email                 = params[:email]
    @user.password              = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save == true
      session[:logged_in_user_id] = @user.id
      flash[:success] = "Your account has been created"
      redirect_to users_path and return
    else
      render :new and return
    end
  end

  def login
    named_user = User.find_by(email: params[:email])
    if named_user != nil &&
       named_user.authenticate(params[:password]) != false
      session[:logged_in_user_id] = named_user.id
    else
      flash[:error] = "Wrong email or password"
    end
    redirect_to users_path and return
  end

  def logout
    session.clear
    redirect_to users_path and return
  end
end
