class Movie < Content
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :plot, presence: true

  default_scope -> { order(:created_at) }
end
