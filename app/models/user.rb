class User < ApplicationRecord
  before_validation { email.downcase! }

  # 名前のバリデーション
  validates :name, presence: { message: "名前を入力してください" }, 
                   length: { maximum: 30 }

  # メールアドレスのバリデーション
  validates :email, presence: { message: "メールアドレスを入力してください" }, 
                    length: { maximum: 255 },
                    uniqueness: { message: "メールアドレスはすでに使用されています" },
                    format: { 
                      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, 
                      message: "有効なメールアドレスを入力してください"
                    }

  # パスワードのバリデーション
  has_secure_password
  validates :password_digest, length: { 
    minimum: 6, 
    message: "パスワードは6文字以上で入力してください" 
  },
  on: :create

  # パスワード（確認）の一致チェック
  validates :password_confirmation, presence: { message: "パスワード（確認）を入力してください" }, on: :create
end
