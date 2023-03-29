require_relative '../item'

class MusicAlbum < Item
  attr_accessor :name, :publish_date
  attr_reader :on_spotify

  def initialize(name, publish_date, on_spotify: false)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
