class SpotifyApi < Grape::API

  resource :spotify do

    desc 'Search Spotify'
    params do
      requires :query, type: String, desc: 'Input query'
    end

    get '/' do
      tracks = Spotify.new(params[:query]).tracks
      artists = Spotify.new(params[:query]).artists
      albums = Spotify.new(params[:query]).albums
      {artists: artists, tracks: tracks, albums: albums}
    end

    desc 'Search tracks'
    params do
      requires :query, type: String, desc: 'Search input'
    end

    get '/tracks' do
      tracks = Spotify.new(params[:query]).tracks
      # represent tracks, with: SpotifyRepresenter
    end

    desc 'Search albums'
    params do
      requires :query, type: String, desc: 'Search input'
    end

    get '/albums' do
      tracks = Spotify.new(params[:query]).albums
    end

    desc 'Search by artist'
    params do
      requires :query, type: String, desc: 'Search input'
    end

    get '/artists' do
      artists = Spotify.new(params[:query]).artists
    end
  end

end
