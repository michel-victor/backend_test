require 'rails_helper'

describe Purchase, type: :model do
  before do
    @purchase = create :purchase
  end

  describe 'purchase relations' do
    it { should belong_to(:user) }
    it { should belong_to(:purchase_option) }
    it { should have_one(:content).through(:purchase_option) }
  end

  describe 'purchase validations' do
    it 'already available content for user' do
      expect(@purchase).to be_invalid
      expect(@purchase.errors[:content]).to include(I18n.t 'errors.messages.purchase.already_available_content')
    end
  end

  describe 'save purchase' do
    it 'returns purchase' do
      expect(Purchase.first.user).to eq(@purchase.user)
      expect(Purchase.first.purchase_option).to eq(@purchase.purchase_option)
    end
  end
end
