class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    # render :layout => 'home'
    @user = User.new
  end

  def javascript
    @user = User.new
  end

  private

  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
