class SoundCloud

  def initialize query
    @query = query
  end

  def tracks
    tracks = SC_CLIENT.get('/tracks', :q => @query, :licence => 'cc-by-sa')
  end

end
