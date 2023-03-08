require 'rails_helper'

describe Content, type: :model do
  before do
    @movie = create :movie
  end

  describe 'content relations' do
    it { should have_many(:purchase_options) }
    it { should have_many(:purchases).through(:purchase_options) }
    it { should have_many(:users).through(:purchases) }
  end

  describe 'save content' do
    it 'returns content' do
      expect(Content.first.title).to eq(@movie.title)
      expect(Content.first.plot).to eq(@movie.plot)
    end
  end
end
