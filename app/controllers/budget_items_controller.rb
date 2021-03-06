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

  def update
    budget_item = current_family.budget_items.find(params[:id])
    budget_item.budget_group_item_ids.destroy_all
    update_groups_belonging_to(budget_item)
     if budget_item.update(budget_item_params)
      redirect_to edit_budget_item_path, notice: "#{budget_item.title}を更新しました"
    else
      render:edit
    end
  end

  def show
  end

  def edit
    set_budget_item
  end

  def destroy
  end

  private

  def budget_item_params
    params.require(:budget_item).permit(:title, :income_flag, :year, :month, :day, :continue_next_month_flag, :amount_plan, :actual_amount)
  end

  def budget_group_ids
    params.require(:budget_item)[:budget_group_item_ids].delete('')
    params.require(:budget_item)[:budget_group_item_ids]
  end

  def set_budget_item
    @budget_item = current_family.budget_items.find(params[:id])
  end

  def budget_group_params_id_exist_flag(i)
    params.require(:budget_item).permit("group_#{i}".to_sym)["group_#{i}".to_sym]
  end

  def update_groups_belonging_to(budget_item)
    current_family.budget_groups.pluck(:id).each do |i|
      if budget_group_params_id_exist_flag(i)
        current_family.budget_groups.find(i).budget_items << budget_item
      end
    end
  end

end
