class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    # render :layout => 'home'
    @email = Email.new
  end

  def create
    @email = Email.new(strong_params)
    @email.save
  end

  private

  def strong_params
    params.require(:email).permit(:address, :name)
  end
end
