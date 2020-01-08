class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    render :layout => 'home'
    @cocktail = Cocktail.new
  end

  def javascript
    @user = User.new
  end

  def dashboard
      if params[:query].present?
        @title = "SEARCH RESULTS"
        @cocktails = Cocktail.global_search(params[:query]).where(owner:current_user)
      else
        @title = "MY COCKTAILS"
        @cocktails = Cocktail.where(owner:current_user).order(:name)
      end
      # @popular = Cocktail.all
  end

  private

  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
