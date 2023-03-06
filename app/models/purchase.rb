class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  has_one :content, through: :purchase_option

  scope :alives, -> { where created_at: (Time.current - 2.days..Time.current) }
  scope :purchase_options, -> { map(&:purchase_option) }
  scope :contents, -> { purchase_options.map(&:content) }

  def alive?
    Time.current.between?(created_at, created_at + 2.days)
  end

  def expires
    created_at + 2.days
  end
end
