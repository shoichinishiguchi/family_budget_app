class CreateBudgetGroupItemIds < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_group_item_ids do |t|
      t.boolean :display_flag, default: true
      t.belongs_to :budget_item
      t.belongs_to :budget_group
      t.timestamps
    end
  end
end
