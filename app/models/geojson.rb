class Geojson
  def self.build_stations(stations)
    stations.map do |station|
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
end
