require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET following" do
    it "returns http success" do
      get :following
      expect(response).to be_success
    end
  end

  describe "GET followers" do
    it "returns http success" do
      get :followers
      expect(response).to be_success
    end
  end

end
