class CreateBudgetAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_amounts do |t|
      t.belongs_to :budget_item
      t.integer :amount_plan
      t.integer :actual_amount
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
