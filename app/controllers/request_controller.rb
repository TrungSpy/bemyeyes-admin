class RequestController < ApplicationController
  def search
    @request = Request.first(session_id:params[:session_id])
    if @request.nil?
      redirect_to "/", alert:"request not found"
      return
    end
    @events = find_request_data @request._id

  end

  def find_request_data request_id
    request_id = request_id.to_s
    coll = MongoMapper.database.collection("event_logs")
    event_logs = coll.aggregate([
      {"$match"=>
        {"event_log_objects" => {"$elemMatch" =>{"json_serialized"=> "\"#{request_id} \""}}}
        }])

    #event_logs.map {|el|  {name:el.name}}
    event_logs
  end
end
