# Army.rb
# Defines an Army, which is a specialized Squad carrying player and faction info

require_relative 'Squad'

class Army < Squad
  def initialize(name, player_name, faction)
    super(name)
    @player_name = player_name
    @faction     = faction
  end

  # Return a string representation of the army, including player, faction, and contained squads
  def to_s
    "Player: #{@player_name},  faction: #{@faction}, army: " + super
  end
end
