class RenameBudgetGroupColumn < ActiveRecord::Migration[5.2]
  def up
    rename_column :budget_groups, :sum_display_flag, :balance_flag
  end

  def dowwn
    rename_column :budget_groups, :balance_flag, :sum_display_flag
  end
end
