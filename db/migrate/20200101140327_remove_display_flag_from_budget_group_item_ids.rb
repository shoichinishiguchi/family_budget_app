class RemoveDisplayFlagFromBudgetGroupItemIds < ActiveRecord::Migration[5.2]
  def up
    remove_column :budget_group_item_ids, :display_flag
  end

  def down
    add_column :budget_group_item_ids, :display_flag, :boolean, default: true
  end
end
