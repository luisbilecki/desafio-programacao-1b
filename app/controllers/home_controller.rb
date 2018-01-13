class HomeController < ApplicationController
  def index
    clear_variables
  end

  def clear_variables
    session.delete(:sales)
    session.delete(:amount)
    session.delete(:not_imported)
  end

end
