class Season < Content
  has_many :episodes

  validates :title, :plot, presence: true
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: { scope: :title }
end
