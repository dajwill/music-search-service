class SoundCloudRepresenter < Napa::Representer
  # include Representable::JSON

  property :source, default: 'Soundcloud'
  property :id, as: :source_id
  property :title, type: String
  property :artwork_url, as: :artwork, type: String
  property :user, as: :artists do
    default: :username
  end
  # property ['user']['username'], as: :artists, type: String
  property :album, default: nil
  property :duration, type: Integer
end
