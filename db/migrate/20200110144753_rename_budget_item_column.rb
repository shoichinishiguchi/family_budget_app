class RenameBudgetItemColumn < ActiveRecord::Migration[5.2]
  def up
    rename_column :budget_items, :continue_next_mont_flag, :continue_next_month_flag
  end

  def dowwn
    rename_column :budget_items, :continue_next_month_flag, :continue_next_mont_flag
  end
end
