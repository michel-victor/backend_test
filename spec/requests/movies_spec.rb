require 'rails_helper'

describe "/movies", type: :request do
  before do
    @movie = create :movie
  end

  describe "GET /index" do
    it "renders a successful response" do
      get movies_url, as: :json
      expect(response).to be_successful
    end

    it "renders a successful dataset" do
      get movies_url, as: :json

      response_data = JSON.parse(response.body)['movies'].first

      expect(response_data['title']).to eq(@movie.title)
      expect(response_data['plot']).to eq(@movie.plot)
    end
  end
end
