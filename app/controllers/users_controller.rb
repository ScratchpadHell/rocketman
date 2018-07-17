class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      redirect_to '/'
      flash[:error] = "Try again, space cowboy"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Updated Successfully'
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Naw, dawg"
      redirect_to "/users/#{@user.id}"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end

private

def user_params
  params.permit(:user_name, :email)
end


end