class BudgetGroupsController < ApplicationController
  def index
    @family = current_user&.family
  end

  def new
    @budget_group = BudgetGroup.new
  end

  def edit
  end

  def show
  end
end
