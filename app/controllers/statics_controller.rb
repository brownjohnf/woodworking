class StaticsController < ApplicationController
  
  skip_authorization_check

  def home
    redirect_to current_user if user_signed_in?
  end
  
end
