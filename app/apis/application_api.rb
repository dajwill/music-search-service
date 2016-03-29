class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount HelloApi => '/'
  mount SoundCloudApi => '/'

  add_swagger_documentation
end
