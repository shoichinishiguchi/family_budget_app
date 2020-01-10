class DeleteBudgetAmountTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :budget_amounts
  end
end
