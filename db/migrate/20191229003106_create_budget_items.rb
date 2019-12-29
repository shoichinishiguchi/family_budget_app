class CreateBudgetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_items do |t|
      t.string :title, null: false
      t.boolean :income_flag, default: false

      t.timestamps
    end
  end
end
