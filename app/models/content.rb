class Content < ApplicationRecord
  has_many :purchase_options
  has_many :purchases, through: :purchase_options
  has_many :users, through: :purchases
end
