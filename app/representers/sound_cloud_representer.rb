class SoundCloudRepresenter < Napa::Representer
  # include Representable::JSON

  property :source, type: String
  property :source_id, type: Integer
  property :title, type: String
  property :artwork, type: String
  property :artists, type: Array
  property :album
  property :duration, type: Integer
end
