require 'json'
require 'open-uri'
class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"

  def get_url(region)
    BASE_URL + "/" + region + "/" + "weekly" + "/" + "latest"
  end

  def get_json(url)
    JSON.load(open(url))
    # load json given a url here
    # refer to the references if you have questions about this
  end

  def get_first_track_info(music_hash)
    track_name = music_hash["tracks"][0]["track_name"]
    album_name = music_hash["tracks"][0]["album_name"]
    artist_name = music_hash["tracks"][0]["artist_name"]
    track_name + " by " + artist_name + " from the album " + album_name
  end


  def most_streamed(region)
    final_url = self.get_url(region)
    get_first_track_info(get_json(final_url))
    # final_url = region.get_url
    # # call on #get_url here, where preference is the string 'most_streamed',
    # # and set it equal to a variable
    # region.get_json(final_url)
    # # call on #get_json here, using the string that get_url returns
    # region.get_first_track_info(final_url)
    # # finally, call on #get_first_track_info using the 
    # # hash that #get_json returns
  end

end
