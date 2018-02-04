class UploadController < ApplicationController
  def create
    return upload_error if params[:file].blank?

    # Parse file
    data = File.read params[:file].path

    fparser = FileParser.new(data)
    @sales = fparser.parse_file
    @amount = fparser.amount
    @not_imported = fparser.not_imported

    # Render show page
    render :show
  end

  def show
    # Check if variables are not empty
    unless @sales && @amount && @not_imported
      upload_error
    end
  end

  private

  def upload_error
    flash[:alert] = 'Please select a .txt file to upload.'
    redirect_to root_path
  end
end
