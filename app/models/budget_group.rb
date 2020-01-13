class BudgetGroup < ApplicationRecord
  include ApplicationHelper
  has_many :budget_group_item_ids, dependent: :destroy
  has_many :budget_items, through: :budget_group_item_ids
  belongs_to :family

  validates :title, presence: { message: "項目名は必須です"}, length: {maximum: 12, message: "項目名は12文字以内でお願いします"}

  COLORS = [
    ["白", "white"],
    ["赤", "#fd2e36"],
    ["オレンジ", "#ff7927"],
    ["黄色", "#f6c344"],
    ["緑", "#a0db35"],
    ["水色", "#1688fa"],
    ["青", "#414fcd"],
  ]

  def plan_sum_in(year, month)
    comma(budget_items.year_month(year, month).map{|item| item.amount_plan || 0}.inject(:+))
  end

  def actual_sum_in(year, month)
    comma(budget_items.year_month(year, month).map{|item| item.actual_amount || 0}.inject(:+))
  end
end
