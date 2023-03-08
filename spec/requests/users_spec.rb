require 'rails_helper'

describe "/users", type: :request do
  let(:valid_params) {
    { content: Content.first.id, quality: @purchase_option.quality }
  }

  let(:invalid_params) {
    { content: 0, quality: '' }
  }

  before do
    @user = create :user
    @purchase_option = create :purchase_option
  end

  describe "POST /:user/purchase" do
    it "make a successful purchase" do
      post purchase_user_url(@user), params: valid_params, as: :json
      expect(response).to be_successful
    end

    it "make a successful dataset purchase" do
      post purchase_user_url(@user), params: valid_params, as: :json

      response_data = JSON.parse(response.body)['purchase']

      expect(response_data['user']).to eq(@user.id)
      expect(response_data['purchase_option']).to eq(@purchase_option.id)
    end

    it "make a duplicate purchase" do
      post purchase_user_url(@user), params: valid_params, as: :json
      post purchase_user_url(@user), params: valid_params, as: :json

      response_data = JSON.parse(response.body)['content']

      expect(response_data).to include(I18n.t 'errors.messages.purchase.already_available_content')
    end

    it "make a purchase with invalid params" do
      post purchase_user_url(@user), params: invalid_params, as: :json

      response_data = JSON.parse(response.body)['purchase_option']

      expect(response_data).to include(I18n.t 'errors.messages.required')
    end
  end

  describe "GET /library" do
    it "renders a successful response" do
      get library_user_url(@user), as: :json
      expect(response).to be_successful
    end

    it "renders a successful dataset" do
      post purchase_user_url(@user), params: valid_params, as: :json
      get library_user_url(@user), as: :json

      response_data = JSON.parse(response.body)['library'].first['movie']

      expect(response_data['content']).to eq(Movie.first.title)
      expect(response_data['quality']).to eq(@purchase_option.quality)
      expect(response_data['expires'].to_json).to eq(Purchase.first.expires.to_json)
    end
  end
end
