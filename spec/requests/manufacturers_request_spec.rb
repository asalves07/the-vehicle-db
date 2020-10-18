require 'rails_helper'

RSpec.describe "Manufacturers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/manufacturers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/manufacturers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/manufacturers/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/manufacturers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/manufacturers/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
