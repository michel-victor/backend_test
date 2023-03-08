require 'rails_helper'

describe Season, type: :model do
  before do
    @season = create :season
  end

  describe 'season relations' do
    it { should have_many(:purchase_options) }
    it { should have_many(:purchases).through(:purchase_options) }
    it { should have_many(:users).through(:purchases) }
    it { should have_many(:episodes).dependent(:destroy) }
  end

  describe 'season validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number).scoped_to(:title) }
    it { should validate_numericality_of(:number).only_integer.is_greater_than(0) }
  end

  describe 'save season' do
    it 'returns season' do
      expect(Season.first.title).to eq(@season.title)
      expect(Season.first.plot).to eq(@season.plot)
      expect(Season.first.number).to eq(@season.number)
    end
  end
end
