class CocktailsController < ApplicationController

    def index
      @cocktails = Cocktail.all
    end

    def new
      @cocktail = Cocktail.new
    end

    def create
      @cocktail = Cocktail.new(validate_params)
      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    end

    def show
      @cocktail = Cocktail.find(params[:id])
      @doses = Dose.all.where(cocktail_id: @cocktail)
      # raise
    end

    def editing
      # raise
      @cocktail = Cocktail.find(params[:id])
      @doses = Dose.all.where(cocktail_id: @cocktail)
      # @dose = @doses.first
      # raise
    end

    def update
      @cocktail = Cocktail.find(params[:id])
      @cocktail.update(validate_params)
      redirect_to cocktail_path(@cocktail)
    end

    def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path

  end


    private

    def validate_params
      params.require(:cocktail).permit(:name)
    end
end
