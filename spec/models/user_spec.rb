require 'rails_helper'

describe User, type: :model do
  before do
    @user = create :user
  end

  describe 'user relations' do
    it { should have_many(:purchases) }
    it { should have_many(:purchase_options).through(:purchases) }
    it { should have_many(:contents).through(:purchase_options) }
  end

  describe 'user validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('john@example.com').for(:email) }
  end

  describe 'save user' do
    it 'returns user' do
      expect(User.first.email).to eq(@user.email)
    end
  end
end
