require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'render index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
