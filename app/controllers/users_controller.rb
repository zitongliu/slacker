class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by :id => params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.assign_attributes(user_params)
    @user.save
  # @user = User.find_by :id => params[:id]

    if @user.update( user_params )
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  # user = User.find_by :id => params[:id]
    user = @current_user
    user.destroy

    redirect_to root_path()
  end


  private
    def user_params
      params.require(:user).permit(:team_id, :username, :name, :email, :password, :password_confirmation)
    end

end
