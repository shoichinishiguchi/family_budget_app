class BudgetItem < ApplicationRecord
  has_many :budget_group_item_ids, dependent: :destroy
  has_many :budget_groups, through: :budget_group_item_ids
  belongs_to :family
  validates :title, presence: { message: "項目名は必須です"}, length: {maximum: 8, message: "項目名は8文字以内でお願いします"}

  scope :year_month, ->(year, month){
    where(year: year, month: month)
  }
  scope :continue_next_month, ->{
    where(continue_next_month_flag: true)
  }

end
