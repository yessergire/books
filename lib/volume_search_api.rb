class VolumeSearchApi
  def self.search_for(volume)
    volume = volume.downcase
    Rails.cache.fetch(volume, :expires_in => 1.week) { fetch_search_for(volume) }
  end

  private

  def self.fetch_search_for(volume)
    url = 'https://www.googleapis.com/books/v1/volumes?q='

    response = HTTParty.get "#{url}#{ERB::Util.url_encode(volume)}"

    volumes = response.parsed_response["items"]

    return [] if volumes.is_a?(Hash) or volumes.nil?

    volumes = [volumes] if volumes.is_a?(Hash)
    volumes.inject([]) do | set, volume |
      set << new_volume(volume)
    end
  end

  def self.new_volume(volume)
    Volume.new(id: volume['id'], selfLink: volume['volumeInfo']['selfLink'],
               title: volume['volumeInfo']['title'], subtitle: volume['volumeInfo']['subtitle'],
               publisher: volume['volumeInfo']['publisher'],
               publishedDate: volume['volumeInfo']['publishedDate'],
               description: volume['volumeInfo']['description'],
               pageCount: volume['volumeInfo']['pageCount'],
               averageRating: volume['averageRating'],
               image: volume['volumeInfo']['imageLinks']['thumbnail'])
  end
end