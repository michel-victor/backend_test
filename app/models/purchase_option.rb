class PurchaseOption < ApplicationRecord
  belongs_to :content
  has_many :purchases
  has_many :users, through: :purchases

  enum quality: [:sd, :hd]

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }, uniqueness: { scope: [:content_id, :quality] }
  validates :content, uniqueness: { scope: :quality }
end
