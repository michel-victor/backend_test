require 'rails_helper'

describe Movie, type: :model do
  before do
    @movie = create :movie
  end

  describe 'movie relations' do
    it { should have_many(:purchase_options) }
    it { should have_many(:purchases).through(:purchase_options) }
    it { should have_many(:users).through(:purchases) }
  end

  describe 'movie validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_uniqueness_of(:title).case_insensitive }
  end

  describe 'save movie' do
    it 'returns movie' do
      expect(Movie.first.title).to eq(@movie.title)
      expect(Movie.first.plot).to eq(@movie.plot)
    end
  end
end
