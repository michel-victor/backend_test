require "rails_helper"

describe SeasonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/seasons").to route_to("seasons#index", format: :json)
    end
  end
end
