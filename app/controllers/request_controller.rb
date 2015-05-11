class RequestController < ApplicationController
def search
  @request = Request.first(session_id:params[:session_id])

end
end
