class Content < ApplicationRecord
  has_many :purchase_options
  has_many :purchases, through: :purchase_options
  has_many :users, through: :purchases

  default_scope -> { order(:created_at) }

  def movie?
    instance_of? Movie
  end

  def season?
    instance_of? Season
  end
end
