class BudgetItemsController < ApplicationController

  def new
    @budget_item = BudgetItem.new
  end

  def create
    @budget_item  = current_family.budget_items.new(budget_item_params)
    budget_group_ids.each do |budget_group_id|
      BudgetGroup.find(budget_group_id.to_i).budget_items << @budget_item
    end
    if @budget_item.save
      redirect_to new_budget_group_path, notice: "#{@budget_item.title}を作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def budget_item_params
    params.require(:budget_item).permit(:title, :income_flag)
  end

  def budget_group_ids
    params.require(:budget_item)[:budget_group_item_ids].delete('')
    params.require(:budget_item)[:budget_group_item_ids]
  end

end
