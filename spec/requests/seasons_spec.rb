require 'rails_helper'

describe "/seasons", type: :request do
  before do
    @season = create :season
  end

  describe "GET /index" do
    it "renders a successful response" do
      get seasons_url, as: :json
      expect(response).to be_successful
    end

    it "renders a successful dataset" do
      get seasons_url, as: :json

      response_data = JSON.parse(response.body)['seasons'].first
      
      expect(response_data['title']).to eq(@season.title)
      expect(response_data['plot']).to eq(@season.plot)
      expect(response_data['number']).to eq(@season.number)
    end
  end
end
