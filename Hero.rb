# Hero.rb
# A specialized EnhancedUnit with boosted quality and defense
require_relative 'EnhancedUnit'

class Hero < EnhancedUnit
  def initialize(name, points)
    super(name, points)
    @quality = 5
    @defense = 5
  end
end
