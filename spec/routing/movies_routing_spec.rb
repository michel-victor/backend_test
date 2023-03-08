require "rails_helper"

describe MoviesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/movies").to route_to("movies#index", format: :json)
    end
  end
end
