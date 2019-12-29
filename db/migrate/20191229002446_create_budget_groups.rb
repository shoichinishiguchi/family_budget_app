class CreateBudgetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_groups do |t|
      t.string :title, null:false
      t.boolean :sum_display_flag, default: false
      t.string :color
      t.belongs_to :family

      t.timestamps
    end
  end
end
