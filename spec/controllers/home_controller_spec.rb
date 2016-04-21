require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all users as @users" do
      get :index, {}, valid_session
      expect(response).to have_http_status(:success)
    end
  end

end
