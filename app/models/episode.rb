class Episode < ApplicationRecord
  belongs_to :season

  default_scope -> { order(:number) }

  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: :season_id }
  validates :plot, presence: true
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: { scope: :season_id }
end
