class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases
  has_many :contents, through: :purchase_options

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, if: :email? }

  def library
    purchases.alives
  end

  def can_purchase?(content)
    library.contents.exclude? content
  end

  def purchase(content:, quality:)
    begin
      can_purchase?(content) ? purchases.create(purchase_option: PurchaseOption.find_by(content:, quality:)) : I18n.t('user.purchase.already_available_content')
    rescue
      I18n.t 'user.purchase.create_error'
    end
  end
end
