class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  has_one :content, through: :purchase_option

  scope :alives, -> { where created_at: (Time.current - 2.days..Time.current) }
  scope :purchase_options, -> { map(&:purchase_option) }
  scope :contents, -> { purchase_options.map(&:content) }

  validate :already_available_content

  def alive?
    Time.current.between?(created_at, created_at + 2.days)
  end

  def expires
    created_at + 2.days
  end

  def write_in_user_library
    begin
      Rails.cache.fetch([user, self], namespace: 'library', expires_in: expires) do
        { content_type: purchase_option.content.type,
          content_title: purchase_option.content.title,
          quality: purchase_option.quality,
          expires: expires }
      end
    rescue
      I18n.t 'errors.library.write'
    end
  end

  class << self
    def reload_library
      if Rails.cache.instance_variable_get(:@data).keys.map { |key| key if key.include?('library:') }.compact.empty?
        begin
          alives.each do |purchase|
            Rails.cache.fetch([purchase.user, purchase], namespace: 'library', expires_in: purchase.expires) do
              { content_type: purchase.purchase_option.content.type, content_title: purchase.purchase_option.content.title, quality: purchase.purchase_option.quality, expires: purchase.expires }
            end
          end
        rescue
          I18n.t 'errors.library.reload'
        end
      end
    end
  end

  private

  def already_available_content
    if user.purchases.alives.contents.include?(content.instance_of?(Content) ? content : Content.find_by(id: content))
      errors.add :content, I18n.t('errors.purchase.already_available_content')
    end
  end
end
