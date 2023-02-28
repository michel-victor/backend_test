class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases
end
