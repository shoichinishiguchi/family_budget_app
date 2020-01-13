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

  def show
  end

  def edit
  end

  def update
    @user = current_family.users.new(family_user_params)
    if @user.save
      redirect_to edit_family_path(current_family), notice: "#{@user.name}を追加しました"
    else
      redirect_to edit_family_path(current_family, name: family_user_params[:name], email: family_user_params[:email]), notice: "#{@user.name}の追加に失敗しました。"
    end
  end

  private

  def family_params
    params.require(:family).permit(:name)
  end

  def family_user_params
    params.require(:family).require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
