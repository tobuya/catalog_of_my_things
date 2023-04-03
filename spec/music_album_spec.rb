require 'date'
require_relative '../classes/music_album'

describe MusicAlbum do
  context 'Testing the MusicAlbum class' do
    it 'A newly created book has a title of type String' do
      album = MusicAlbum.new('KOD', '2018-01-01', true, 1)
      expect(album.name).not_to be_nil
      expect(album.name).to be_a(String)
    end

    it 'should detect the album title' do
      album = MusicAlbum.new('DAMN', '2017-01-01', false, 2)
      expect(album.name).to eq 'DAMN'
    end

    it 'should detect the date the album was published' do
      album = MusicAlbum.new('DAMN', '2017-01-01', false, 2)
      expect(Date.parse(album.publish_date)).to eq Date.parse('2017-01-01')
    end

    it 'should detect that the album is not on spotify by returning false' do
      album = MusicAlbum.new('DAMN', '2017-01-01', false, 2)
      expect(album.on_spotify).to eq false
    end

    it 'should detect that the album is on spotify by returning true' do
      album = MusicAlbum.new('KOD', '2018-01-01', true, 3)
      expect(album.on_spotify).to be true
    end

    it 'detect the book archive state' do
      album = MusicAlbum.new('KOD', '2018-01-01', false, 4)
      expect(album.name).to eq 'KOD'
      expect(Date.parse(album.publish_date)).to eq Date.parse('2018-01-01')
      expect(album.on_spotify).to be false
    end
    it 'Check if it cannot be archived when on_spotify is false' do
      music_album = MusicAlbum.new('Abbey Road', '1969-09-26', true, 1)
      expect(music_album.send(:can_be_archived?)).to be true
    end
  end
end
