class StaticsController < ApplicationController
  
  skip_authorization_check

  def home
    unless user_signed_in?
      redirect_to '/splash'
    else
      @articles = Article.order('updated_at DESC').limit(10)
      @user = current_user
      render 'home'
    end
  end
  
  def splash
    
  end
  
end
