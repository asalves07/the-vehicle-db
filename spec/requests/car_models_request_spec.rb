require 'rails_helper'

RSpec.describe "CarModels", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/car_models/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/car_models/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/car_models/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/car_models/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/car_models/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
