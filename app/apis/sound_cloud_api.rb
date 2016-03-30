class SoundCloudApi < Grape::API

  resource :soundcloud do

    desc 'Search SoundCloud'
    params do
      requires :query, type: String, desc: 'Input query'
    end

    get '/' do
      tracks = SoundCloud.new(params[:query]).tracks
      artists = SoundCloud.new(params[:query]).artists
      {artists: artists, tracks: tracks}
    end

    desc 'Search tracks'
    params do
      requires :query, type: String, desc: 'Search input'
    end

    get '/tracks' do
      tracks = SoundCloud.new(params[:query]).tracks
      represent tracks, with: SoundCloudRepresenter
    end

    desc 'Search by artist'
    params do
      requires :query, type: String, desc: 'Search input'
    end

    get '/artists' do
      artists = SoundCloud.new(params[:query]).artists
    end
  end

end
