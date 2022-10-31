class Meeting < ApplicationRecord
  def create_zoom_meeting(topic)
    zoom_client = Zoom.new
    # response = zoom_client.meeting_create(topic: topic, user_id: ENV['ZOOM_USER_ID'])
    response['join_url']
  end
  
  def save_zoom_link(topic)
	return if zoom_link.present?
	_zoom_link = create_zoom_meeting(topic)
	update(zoom_link: _zoom_link)
  end
end
