require 'rails_helper'

describe Episode, type: :model do
  before do
    @episode = create :episode
  end

  describe 'episode relations' do
    it { should belong_to(:season) }
  end

  describe 'episode validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:title).case_insensitive.scoped_to(:season_id) }
    it { should validate_numericality_of(:number).only_integer.is_greater_than(0) }
    it { should validate_uniqueness_of(:number).scoped_to(:season_id) }
  end

  describe 'save episode' do
    it 'returns episode' do
      expect(Episode.first.title).to eq(@episode.title)
      expect(Episode.first.plot).to eq(@episode.plot)
      expect(Episode.first.number).to eq(@episode.number)
    end
  end
end
