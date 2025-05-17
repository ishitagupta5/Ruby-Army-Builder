# Upgrade.rb
# Represents an upgrade that can be applied to a Unit
require_relative 'GameElement'

class Upgrade
  include GameElement

  # Create an upgrade with a name and point cost  
  def initialize(name, points)
    @name   = name
    @points = points.to_i
  end

  # GameElement API
  def getName
    @name
  end

  # Return the upgrade's point value
  def getPoints
    @points
  end

  # String representation of the upgrade
  def to_s
    "#{@name} (#{@points})"
  end
end
