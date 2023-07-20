# spec/controllers/group_controller_spec.rb
require 'rails_helper'

RSpec.describe GroupController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    context "when user is authenticated" do
      before do
        sign_in user
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end

      it "assigns @user" do
        get :index
        expect(assigns(:user)).to eq(user)
      end

      it "assigns @groups with the user's groups in descending order" do
        group1 = create(:group, user: user, created_at: 2.days.ago)
        group2 = create(:group, user: user, created_at: 1.day.ago)
        get :index
        expect(assigns(:groups)).to eq([group2, group1])
      end
    end

    context "when user is not authenticated" do
      it "redirects to sign in page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
