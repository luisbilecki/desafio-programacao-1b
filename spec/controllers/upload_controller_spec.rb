require 'rails_helper'

RSpec.describe UploadController, type: :controller do
  describe 'testing POST #create' do
    context 'with file' do
      it 'redirect to show (upload_path)' do
          post :create, file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/testfile.txt')))
          expect(response).to redirect_to(upload_path)
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
    context 'when session variables exists' do
      before{
        parser = build(:file_parser)

        #build session
        session[:sales] = parser.parse_file
        session[:amount] = parser.amount
        session[:not_imported] = parser.not_imported
        get :show
      }

      it 'response should be success' do
        expect(response).to be_success
      end
    end

    context 'when session variables not exists' do
      it 'response should be not success' do
        get :show
        expect(response).not_to be_success
      end
    end
  end
end
