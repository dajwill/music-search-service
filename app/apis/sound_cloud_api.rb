class SoundCloudApi < Grape::API

  resource :soundcloud do
    desc 'Return a Souncloud message'
    get do
      { message: 'SoundCloud request, from Music-search-service!' }
    end

    desc 'Search tracks'
    params do
      requires :query, type: String, desc: 'Search input'
    end

    get '/tracks' do
      tracks = SoundCloud.new(params[:query]).tracks
      represent tracks, with: SoundCloudRepresenter
    end
  end

end
