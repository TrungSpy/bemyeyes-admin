class HomeController < ApplicationController
  before_filter :ensure_user_authenticated!, :except => [:index]
  def index
  end
  
  def show
  end
end
