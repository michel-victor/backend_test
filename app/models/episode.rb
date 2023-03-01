class Episode < ApplicationRecord
  belongs_to :season

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :season }
  validates :plot, presence: true
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: { scope: :season }
end
