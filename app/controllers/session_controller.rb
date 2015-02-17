class SessionController < ApplicationController
  def new
    unless session[:user_id].nil?
       redirect_to( '/', alert: "Please log out")
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    if email.blank? || password.blank?
     redirect_to({ action: 'new' }, alert: "Please provide both email and password")
     return
    end
    user = User.authenticate_using_email(email, password)
Rails.logger.info "User is here : #{user}"
    unless user.nil?
      session[:user_id] = user.id
      redirect_to "/"
      return
    end
    redirect_to({ action: 'new' }, alert: "Invalid email or password#{email} #{password}")
  end

  def delete
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end
end
