class UploadController < ApplicationController
  def create
    #Validate file
    if params[:file].blank?
      upload_error
    else
      #Parse file
      data = File.read params[:file].path

      fparser = FileParser.new(data)
      sales = fparser.parse_file
      session[:sales] = sales
      session[:amount] = fparser.amount
      session[:not_imported] = fparser.not_imported

      #Redirect to show
      redirect_to upload_path
    end
  end

  def show
    @sales = session[:sales]
    @amount = session[:amount]
    @not_imported = session[:not_imported]

    #Check if variables are not empty
    unless @sales && @amount && @not_imported
      upload_error
    end
  end

  private

  def upload_error
    flash[:alert] = "Please select a .txt file to upload."
    redirect_to root_path
  end
end
