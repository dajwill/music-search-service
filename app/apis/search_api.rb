class SearchApi < Grape::API
  desc 'Search everything'
  params do
    requires :query, type: String, desc: 'Search input'
  end

  get do
    tracks = Spotify.new(params[:query]).tracks + SoundCloud.new(params[:query]).tracks
    artists = Spotify.new(params[:query]).artists + SoundCloud.new(params[:query]).artists
    albums = Spotify.new(params[:query]).albums
    {tracks: tracks, artists: artists, albums: albums}
  end

  desc 'Search tracks'
  params do
    requires :query, type: String, desc: 'Search input'
  end

  get '/tracks' do
    tracks = Spotify.new(params[:query]).tracks
    tracks.push(SoundCloud.new(params[:query]).tracks)
  end

  desc 'Search artists'
  params do
    requires :query, type: String, desc: 'Search input'
  end

  get '/artists' do
    tracks = Spotify.new(params[:query]).artists
    tracks.push(SoundCloud.new(params[:query]).artists)
  end

  desc 'Search albums'
  params do
    requires :query, type: String, desc: 'Search input'
  end

  get '/albums' do
    tracks = Spotify.new(params[:query]).albums
  end
end
