class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases
  has_many :contents, through: :purchase_options

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, if: :email? }

  def library
    Purchase.reload_library
    Rails.cache.instance_variable_get(:@data).keys.map { |key| key if key.include?("library:users/#{id}/") }.compact.collect { |key| Rails.cache.read(key) }.compact
  end
end
