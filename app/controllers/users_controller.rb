class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(strong_params)
    @user.save!
  end


   private

  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
