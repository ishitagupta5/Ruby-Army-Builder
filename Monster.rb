# Monster.rb
# A specialized EnhancedUnit with moderately boosted stats
require_relative 'EnhancedUnit'

class Monster < EnhancedUnit
  def initialize(name, points)
    super(name, points)
    @quality = 4
    @defense = 4
  end
end
