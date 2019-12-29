class User < ApplicationRecord
  belongs_to :family

  before_save { email.downcase! }
  validates :name, presence: { message: "名前は必須です"}, length: {maximum: 12, message: "名前は12文字以内でお願いします"}
  validates :email,
   uniqueness:{ message: "メールアドレスが間違えているか、既に登録されています"},
   format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message:"メールアドレスが間違えているか、既に登録されています"},allow_blank: true
   validates :email,presence: { message: "メールアドレスは必須です"}
   validates :password, presence: true, length: { minimum: 6, message: "パスワードは6文字以上でお願いします" }
   has_secure_password
end
