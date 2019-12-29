class BudgetItem < ApplicationRecord
  has_many :budget_group_item_ids, dependent: :destroy
  has_many :budget_items, through: :budget_group_item_ids
  has_many :budget_amount
  belongs_to :family

  validates :title, presence: { message: "項目名は必須です"}, length: {maximum: 8, message: "項目名は8文字以内でお願いします"}
end
