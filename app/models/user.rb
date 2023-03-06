class User < ApplicationRecord
  has_many :purchases
  has_many :purchase_options, through: :purchases
  has_many :contents, through: :purchase_options

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, if: :email? }

  def library
    Rails.cache.instance_variable_get(:@data).keys.map { |key| key if key.include?("library:users/#{id}/") }.compact.collect { |key| Rails.cache.read(key) }.compact
  end

  def can_purchase?(content)
    purchases.alives.contents.exclude? content
  end

  def purchase(content:, quality:)
    if can_purchase?(content)
      if (purchase = purchases.create(purchase_option: PurchaseOption.find_by(content:, quality:)))
        begin
          Rails.cache.fetch([self, purchase], namespace: 'library', expires_in: purchase.expires) do
            { content_type: content.type, content_title: content.title, quality: quality, expires: purchase.expires }
          end
        rescue
          I18n.t 'user.library.add_error'
        end
      else
        I18n.t 'user.purchase.create_error'
      end
    else
      I18n.t('user.purchase.already_available_content')
    end
  end
end
