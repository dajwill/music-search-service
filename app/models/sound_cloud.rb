class SoundCloud

  def initialize query
    @query = query
  end

  def tracks
    tracks = SC_CLIENT.get('/tracks', :q => @query, :licence => 'cc-by-sa')
    tracks.map do |track|
      {
        "source" => 'soundcloud',
        "source_id" => track.id,
        "title" => track.title,
        "artists" => [ track.user.username ],
        "album" => nil,
        "duration" => track.duration,
      }
    end
  end

  def artists
    artists = SC_CLIENT.get('/users', :q => @query, :licence => 'cc-by-sa')
    artists.map do |artist|
      {
        "name" => artist.username,
        "id" => artist.id,
        "image" => artist.avatar_url,
        "source" => 'soundcloud'
      }
    end
  end

end
