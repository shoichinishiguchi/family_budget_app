class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :current_user
  helper_method :current_family
  before_action :login_required


  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_family
    @current_user&.family
  end

  def login_required
    unless current_user
      redirect_to login_path, notice: "ログインまたは、新規登録をしてください。"
    end
  end

end
