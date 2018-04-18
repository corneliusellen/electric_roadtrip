class Geojson

  def self.build_station(station)
    {
        "type": "Feature",
        "geometry": {
            "type": "Point",
            "coordinates": station
        },
        "properties": {
            "icon": "monument"
        }
    }
  end

end
