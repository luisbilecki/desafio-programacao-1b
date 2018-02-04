require 'rails_helper'

RSpec.describe UploadController, type: :controller do
  describe 'testing POST #create' do
    context 'with file' do
      it 'render show (upload_path)' do
          post :create, file: Rack::Test::UploadedFile.new(File.open(
            File.join(Rails.root, '/spec/fixtures/files/testfile.txt')))
          expect(response).to render_template(:show)
      end
    end

    context 'without file' do
      before { post :create }

      it 'redirect to root_path' do
        expect(response).to redirect_to(root_path)
      end

      it 'show a flash message' do
        expect(flash[:alert]).to be_present
        expect(flash[:alert]).to eq("Please select a .txt file to upload.")
      end
    end
  end

  describe 'testing GET #show' do
    before { get :show }

    it 'without instance variables' do
      expect(response).not_to be_success
    end

    it 'show a flash message' do
      expect(flash[:alert]).to be_present
      expect(flash[:alert]).to eq("Please select a .txt file to upload.")
    end
  end
end
