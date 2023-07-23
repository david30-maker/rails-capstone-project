require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET /splash' do
    context 'when user is authenticated' do
      before do
        sign_in user
      end

      it 'should redirect to group index page' do
        get :splash
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(group_index_path)
      end
    end

    context 'when user is not authenticated' do
      it 'should render splash page' do
        get :splash
        expect(response).to have_http_status(200)
        expect(response).to render_template(:splash)
      end
    end
  end
end
