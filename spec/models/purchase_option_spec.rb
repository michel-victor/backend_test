require 'rails_helper'

describe PurchaseOption, type: :model do
  before do
    @purchase_option = create :purchase_option
  end

  describe 'purchase_option relations' do
    it { should belong_to(:content) }
    it { should have_many(:purchases) }
    it { should have_many(:users).through(:purchases) }
  end

  describe 'purchase_option validations' do
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { should validate_uniqueness_of(:price).scoped_to([:content_id, :quality]) }
    it { should validate_uniqueness_of(:content).scoped_to(:quality) }
  end

  describe 'save purchase_option' do
    it 'returns purchase_option' do
      expect(PurchaseOption.first.content).to eq(@purchase_option.content)
      expect(PurchaseOption.first.price).to eq(@purchase_option.price)
      expect(PurchaseOption.first.quality).to eq(@purchase_option.quality)
    end
  end
end
