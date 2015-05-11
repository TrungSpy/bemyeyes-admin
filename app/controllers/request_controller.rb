class RequestController < ApplicationController
  def search
    @request = Request.first(session_id:params[:session_id])
    if @request.nil?
      redirect_to "/", alert:"request not found"
      return
    end
  end
end
