require 'zoomus'
Zoomus.configure do |c|
  c.api_key = ENV['ZOOM_US_API_KEY']
  c.api_secret = ENV['ZOOM_US_API_SECRET']
end