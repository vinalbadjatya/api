class MeetingsController < ApplicationController
  # def create 
  #   @meeting = Meeting.new(meeting_params)
  #   @meeting.save_zoom_link(@meeting.name)
  #   @meeting.save
  #   redirect_to meeting_path(@meeting)
  # end


  # def create 
  #   require 'uri'
  #       require 'net/http'
  #       require 'openssl'
  #       byebug
  #       url = URI("https://api.zoom.us/v2/users/me/meetings")
  #       http = Net::HTTP.new(url.host, url.port)
  #       # http.use_ssl = true
  #       # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #       request = Net::HTTP::post.new(url)
  #       byebug
  #       request["content-type"] = 'application/json'
  #       byebug
  #       request["authorization"] = 'Bearer ' + current_user.access_token
    
  #       response = http.request(request)
  #       puts response.read_body
  # end
  
  # params_hash ={}
  # params_hash[:topic] = "java class"
  # params_hash[:type] = 2
  # params_hash[:start_time] = "02:30"
  # params_hash[:duration]= "1"
  # params_hash.to_json

  def zoom
		# byebug
		# response = HTTParty.get('https://api.zoom.us/v2/users/me/meetings.json', headers: {'Content-Type' => 'application/json'}, :body => params_hash.to_json)
    response = HTTParty.get('https://api.zoom.us/v2/users/me/meetings',:headers => {
      "Api-Key" => "ZOOM_US_API_KEY",
      "Content-Type" => "application/json",
      "Authorization" => "Bearer eyJhbGciOiJIUzUxMiIsInYiOiIyLjAiLCJraWQiOiJjMGRhMGRiMi01MmNjLTRmMDYtYWUxYS03YmY2NjI0YjllYWMifQ.eyJ2ZXIiOjcsImF1aWQiOiI3ZDhjMjIyN2Q2ZGYyOGM0ZDlmMjhhN2U1NTZlMjEzOSIsImNvZGUiOiJrcDE4b1MzVWQxSG5hdmx3ZHhTU2E2ZngwMF9ndnhlRWciLCJpc3MiOiJ6bTpjaWQ6Ylhab0dqV1BSZ0NsNTZGOXhNUHhzUSIsImdubyI6MCwidHlwZSI6MCwidGlkIjowLCJhdWQiOiJodHRwczovL29hdXRoLnpvb20udXMiLCJ1aWQiOiJyZkRTeTIyUVFvaUdnUkw2VmY0b0xnIiwibmJmIjoxNjY2MzM5NTU4LCJleHAiOjE2NjYzNDMxNTgsImlhdCI6MTY2NjMzOTU1OCwiYWlkIjoiZ1dTSGxiSlpUTkc5alVUN1A5SEIyUSIsImp0aSI6ImI4NGI1MzNlLTVhZjEtNDA4NS05ODI5LTQ2NDU0NjA5M2IyYiJ9.fJaRsKg_1UCrxBcu0gw4Ln4ODEJ7S0FmEncwtzgXBcwLtPFJ0A4c6OyDY0l7IJypHjAZIeuWUvjnJ6-vZRrKIw"})
    puts response
	end
  private

  def meeting_params
	  params.require(:meeting).permit(:topic, :start_time, :end_time, :duration, :host_name, :limit, :zoom_link)
  end
end
