class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

private

def find_user
  @user = User.find(params[:id])
end

def user_params
  params.permit(:name, :email)
end

end