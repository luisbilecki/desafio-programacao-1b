require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    before { get :index}
    it 'render index page' do
      expect(response).to render_template(:index)
    end

    it 'should be success' do
      expect(response).to be_success
    end
  end
end
