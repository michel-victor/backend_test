require "rails_helper"

describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #library" do
      expect(get: "/users/1/library").to route_to("users#library", id: "1", format: :json)
    end

    it "routes to #purchase" do
      expect(post: "/users/1/purchase").to route_to("users#purchase", id: "1", format: :json)
    end
  end
end
