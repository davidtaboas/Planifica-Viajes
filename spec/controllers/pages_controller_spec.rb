require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET features" do
    it "returns http success" do
      get :features
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

end
