class Spotify

  def initialize query
    @query = query
  end

  def tracks
    tracks = RSpotify::Track.search(@query)
    tracks.map do |track|
      [
        {
          source: 'spotify',
          id: track.id,
          title: track.name,
          album: track.album.name,
          artists: track.artists.map{|a| a.name},
          duration: track.duration_ms
        }
      ]
    end
  end

  def albums
    albums = RSpotify::Album.search(@query)
    albums.map do |album|
      [
        {
          source: 'spotify',
          id: album.id,
          name: album.name,
          image: album.images.first['url'],
          songs: album.tracks.map{|t| t.name}
        }
      ]
    end
  end

  def artists
    artists = RSpotify::Artist.search(@query)
    artists.map do |artist|
      [
        {
          source: 'spotify',
          id: artist.id,
          image: artist.images.first,
          name: artist.name
        }
      ]
    end
  end

end
