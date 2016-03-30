class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount HelloApi => '/'
  mount SoundCloudApi => '/'
  mount SpotifyApi => '/'
  mount SearchApi => '/'

  add_swagger_documentation
end
