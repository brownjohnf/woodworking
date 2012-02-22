class StaticsController < ApplicationController
  
  skip_authorization_check

  def home
    if user_signed_in?
      @articles = Article.limit(10)
      @user = current_user
      render 'home'
    else
      redirect_to '/splash'
    end
  end
  
  def splash
    
  end
  
end
