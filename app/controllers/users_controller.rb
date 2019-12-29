class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]


  def new
    @user = User.new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @user = @family.users.new(user_params)
    @user.head_of_family = true
    if @user.save
      redirect_to root_path, notice: "#{@user.name}さん、ようこそ！"
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def family_params
    params.require(:user).require(:family).permit(:name)
  end

end
