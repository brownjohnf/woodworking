class StaticsController < ApplicationController

  def home
    redirect_to users_path if user_signed_in?
  end
end
