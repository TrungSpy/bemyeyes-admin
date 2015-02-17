class HomeController < ApplicationController
  before_filter :ensure_user_authenticated!, :except => [:index]
  def index
    @user = User.first
  end
  
  def show
  end
end
