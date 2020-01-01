class FamiliesController < ApplicationController
  def show
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
    else
      render :new
    end
  end

  private

  def family_params
    params.require(:family).permit(:name)
  end

end
