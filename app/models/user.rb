class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, if: :email? }
end
