class OpentokController < ApplicationController
  def session_attach
    @session_id =  params["session_id"]
    @api_key = ENV["opentok_api_key"]
    @token = params["token"]
  end
end
