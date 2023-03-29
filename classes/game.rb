require_relative '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date, archived: false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    @last_played_at = Date.today - Date.parse(last_played_at)
    super() && @last_played_at > 2
  end
end
