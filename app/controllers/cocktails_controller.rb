class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cocktail, only: [:show, :edit, :editing, :update, :destroy, :new_instructions, :update_instructions]


  def index
    @popular = policy_scope(Cocktail)
    if params[:query].present?
      @title = "RESULTS FOR: \"#{params[:query].upcase}\""
      @popular = Cocktail.global_search(params[:query])
    else
      @title = "THE MOST POPULAR"
      @popular = Cocktail.where(popular:true).order(:name)
    end
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
    @categories = []
    results = Cocktail.select(:category).distinct(:category).to_ary
    results.each do |cocktail|
      @categories << cocktail.category
    end
    @categories
  end

  def create
    @cocktail = Cocktail.new(validate_params)
    authorize @cocktail
    @cocktail.owner = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @doses = Dose.all.where(cocktail_id: @cocktail)
    authorize @cocktail
    # raise
  end

  def editing
    authorize @cocktail
    if current_user != @cocktail.owner
      redirect_to root_path
    else
      @doses = Dose.all.where(cocktail_id: @cocktail)
      # @dose = @doses.first
      # raise
    end
  end

  def update
    authorize @cocktail
    @cocktail.update(validate_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
  authorize @cocktail
  @cocktail.destroy
  redirect_to dashboard_path
  end

  def new_instructions
    authorize @cocktail
  end

  def update_instructions
    @cocktail.update(validate_params[:instructions])
  end

  private

  def validate_params
    params.require(:cocktail).permit(:name, :instructions, :popular, :category)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
