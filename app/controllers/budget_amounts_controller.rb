class BudgetAmountsController < ApplicationController
  def create
    @budget_amount = BudgetAmount.new(budget_amount_params)
    if @budget_amount.save
      redirect_to new_budget_group_path, notice: "#{@budget_amount.budget_item.title}の#{@budget_amount.year}年#{@budget_amount.month}月の金額を作成しました"
    else
      render template: "budget_group/new"
    end
  end

  def update
    @budget_amount = BudgetAmount.new(budget_amount_params)
    if @budget_amount.save
      redirect_to new_budget_group_path, notice: "#{@budget_amount.budget_item.title}の#{@budget_amount.year}年#{@budget_amount.month}月の金額を修正しました"    else
      render template: "budget_group/new"
    end
  end

  private

  def budget_amount_params
    params.require(:budget_amount).permit(:amount_plan, :actual_amount, :year, :month, :budget_item_id)
  end

end
