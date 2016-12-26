module RecordHelper
  def google_map_path template_location
    latitude  = template_location.latitude
    longitude = template_location.longitude
    "http://maps.google.com/?q=#{latitude},#{longitude}"
  end
end
