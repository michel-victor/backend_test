class Movie < Content
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :plot, presence: true
end
