class BudgetItem < ApplicationRecord
  has_many :budget_group_item_ids, dependent: :destroy
  has_many :budget_groups, through: :budget_group_item_ids
  has_many :budget_amounts
  belongs_to :family
  validates :title, presence: { message: "項目名は必須です"}, length: {maximum: 8, message: "項目名は8文字以内でお願いします"}

  def amount_in(year: Time.now.year ,month: Time.now.month)
    budget_amounts.where(year: year).where(month: month).last
  end


  def amount_plan(year: Time.now.year ,month: Time.now.month)
    budget_amounts.where(year: year).where(month: month).last&.amount_plan
  end

  def actual_amount(year: Time.now.year ,month: Time.now.month)
    budget_amounts.where(year: year).where(month: month).last&.actual_amount
  end

end
