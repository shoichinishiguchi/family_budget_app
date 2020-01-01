class AddDisplayFlagToBudgetAmounts < ActiveRecord::Migration[5.2]
  def change
    add_column :budget_amounts, :display_flag, :boolean, default: true
  end
end
