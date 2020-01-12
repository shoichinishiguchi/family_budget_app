class BudgetGroupsController < ApplicationController

  def index
    @family = current_user&.family
    @budget_groups = current_family.budget_groups.includes(:budget_items)
  end

  def new
    @budget_group = BudgetGroup.new
    @budget_groups = current_family.budget_groups.includes(:budget_items)
    set_year_month
    if params[:year] && params[:month]
      items_to_next_month(@year, @month).each do |item|
        next_item = current_family.budget_items.new(next_month_params(item))
        if next_item.save
          item.budget_groups.each do |budget_group|
            budget_group.budget_items  << next_item
          end
          item.update(continue_next_month_flag: false)
        end
      end
    end

    @budget_item = BudgetItem.new
  end

  def create
    @budget_group = current_family.budget_groups.new(budget_group_params)
    budget_item_ids&.each do |budget_item_id|
      BudgetItem.find(budget_item_id.to_i).budget_groups << @budget_group
    end

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

  def budget_item_ids
    params.require(:budget_group)[:budget_group_item_ids]&.delete('')
    params.require(:budget_group)[:budget_group_item_ids]
  end

  def set_year_month
    @year = (params[:year] || Time.now.year).to_i
    @month = (params[:month] || Time.now.month).to_i
  end

  def items_to_next_month(year, month)
    current_family.budget_items.year_month(prev_year(year, month), prev_month(month)).continue_next_month
  end

  def next_month_params(item)
    {title: item.title, income_flag: item.income_flag, month: next_month(item.month), year: next_year(item.year, item.month), continue_next_month_flag: true}
  end

end
