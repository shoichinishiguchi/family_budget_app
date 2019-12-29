class Family < ApplicationRecord
  has_many :users
  has_many :budget_groups

  validates :name, presence: { message: "名前は必須です"}, length: {maximum: 12, message: "名前は12文字以内でお願いします"}

end
