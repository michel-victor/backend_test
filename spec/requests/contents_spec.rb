require 'rails_helper'

describe "/contents", type: :request do
  before do
    @movie = create :movie
    @season = create :season
  end

  describe "GET /index" do
    it "renders a successful response" do
      get contents_url, as: :json
      expect(response).to be_successful
    end

    it "renders a successful dataset" do
      get contents_url, as: :json

      respose_data_movie = JSON.parse(response.body)['contents'].first
      respose_data_season = JSON.parse(response.body)['contents'].last

      expect(respose_data_movie['title']).to eq(@movie.title)
      expect(respose_data_movie['plot']).to eq(@movie.plot)

      expect(respose_data_season['title']).to eq(@season.title)
      expect(respose_data_season['plot']).to eq(@season.plot)
      expect(respose_data_season['number']).to eq(@season.number)
    end
  end
end
