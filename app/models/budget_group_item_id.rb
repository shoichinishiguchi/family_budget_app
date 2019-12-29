class BudgetGroupItemId < ApplicationRecord
  belongs_to :budget_item
  belongs_to :budget_group
end
