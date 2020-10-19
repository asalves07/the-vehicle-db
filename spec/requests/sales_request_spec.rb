require 'rails_helper'

RSpec.describe "Sales", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/sales/show"
      expect(response).to have_http_status(:success)
    end
  end

end
