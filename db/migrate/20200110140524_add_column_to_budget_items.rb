class AddColumnToBudgetItems < ActiveRecord::Migration[5.2]
  def change
    add_column :budget_items, :amount_plan, :integer
    add_column :budget_items, :actual_amount, :integer
    add_column :budget_items, :month, :integer, null: false
    add_column :budget_items, :year, :integer, null: false
    add_column :budget_items, :continue_next_mont_flag, :boolean, default: false
  end
end
