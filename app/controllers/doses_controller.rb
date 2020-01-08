class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    if current_user != @cocktail.owner
      redirect_to root_path
    else
      @dose = Dose.new
      @ingredients = Ingredient.all.order(:name)
    end
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    if current_user != @cocktail.owner
      redirect_to root_path
    else
    @dose = Dose.new(validate_params)
    @dose.cocktail = @cocktail
      if @dose.save!
        redirect_to editing_path(@cocktail)
      else
        render :new
      end
    end
  end

  def edit
    @dose = Dose.find(params[:id])
    if current_user != @dose.cocktail.owner
      redirect_to root_path
    end
  end

  def update
    @dose = Dose.find(params[:id])
    if current_user != @dose.cocktail.owner
      redirect_to root_path
    else
    @dose.update(validate_params)
    redirect_to editing_path(@dose.cocktail_id)
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    if current_user != @dose.cocktail.owner
      redirect_to root_path
    else
    # raise
    # raise
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # THIS DOES NOT WORK SINCE THE ID FROM PARAMS IS FOR THE DOSE
    # NOT FOR THE COCKTAIL. USE DOSE.COCKTAIL TO GET COCKTAIL
    #
    @dose.destroy
    redirect_to editing_path(@dose.cocktail)
    end
  end



  def validate_params
  # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
