class AddFamilyIdToBudgetItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :budget_items, :family, foreign_key: true
  end
end
