# Unit.rb
# Base class for all game elements (units and upgrades)
require_relative 'GameElement'

class Unit
  include GameElement

  attr_accessor :name, :points, :quality, :defense
  attr_reader   :upgrades

  # Create a unit with name and point cost, default quality/defense to 2
  def initialize(name, points)
    @name     = name
    @points   = points.to_i
    @quality  = 2
    @defense  = 2
    @upgrades = []
  end

  # GameElement API
  def getName
    @name
  end

  # Return the unit's total points: base + upgrades
  def getPoints
    @points + @upgrades.sum(&:getPoints)
  end

  # Add an upgrade to this unit
  def addUpgrade(upgrade)
    @upgrades << upgrade
  end

  # Remove an upgrade from this unit
  def removeUpgrade(upgrade)
    @upgrades.delete(upgrade)
  end

  # String representation including upgrades if present  
  def to_s
    base = "#{@name} (#{getPoints}, #{@quality}, #{@defense})"
    if @upgrades.any?
      u_str = @upgrades.map(&:to_s).join(', ')
      base + " upgrades: [#{u_str}]"
    else
      base
    end
  end
end
