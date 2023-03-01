class PurchaseOption < ApplicationRecord
  belongs_to :content
  has_many :purchases
  has_many :users, through: :purchases

  enum quality: [:sd, :hd]

  validates :price, presence: true, uniqueness: { scope: [:content, :quality] }
end
