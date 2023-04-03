require_relative '../classes/music_album'
require_relative '../classes/genre'
require 'date'

describe Genre do
  context 'When testing the Label class' do
    album = MusicAlbum.new('KOD', '2018-01-01', true, 0)
    genre = Genre.new(1, 'Rap')

    it 'Should check if the genre title of the album is Rap' do
      expect(genre.name).to eq 'Rap'
    end

    it 'should add album item object to genre items array' do
      genre.add_item(album)
      expect(genre.items[0]).to eq album
    end
  end
end
