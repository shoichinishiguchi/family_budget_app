class BudgetGroupsController < ApplicationController
  def index
    @family = current_user&.family
    @budget_groups = current_family.budget_groups.includes(:budget_items)
  end

  def new
    @budget_group = BudgetGroup.new
    @budget_groups = current_family.budget_groups.includes(budget_items: [:budget_amounts])
    @year = params[:year] || Time.now.year
    @month = params[:month] || Time.now.month
  end

  def create
    @budget_group = current_family.budget_groups.new(budget_group_params)
    if @budget_group.save
      redirect_to new_budget_group_path, notice: "#{@budget_group.title}を作成しました"
    else
      @budget_groups = current_family.budget_groups
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def budget_group_params
    params.require(:budget_group).permit(:title, :color)
  end

end
