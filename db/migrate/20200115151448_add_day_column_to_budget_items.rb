class AddDayColumnToBudgetItems < ActiveRecord::Migration[5.2]
  def change
    add_column :budget_items, :day, :integer, null: false
  end
end
