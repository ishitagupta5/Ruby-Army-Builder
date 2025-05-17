# Squad.rb
# Implements a Squad, which is an EnhancedUnit that can contain sub-units
require_relative 'EnhancedUnit'

class Squad < EnhancedUnit
  def initialize(name)
    super(name, 0)
    @units = []
  end
  
  # Add a unit (Hero, Monster, Unit, etc.) to this squad
  def add_unit(unit)
    @units << unit
  end

  # Remove a specific unit from this squad
  def remove_unit(unit)
    @units.delete(unit)
  end
  
  # Calculate total points by summing points of all child units
  def getPoints
    @units.sum(&:getPoints)
  end

  # Generate a string representation including name, stats, and contained units
  def to_s
    s = "#{@name} (#{getPoints}, #{@quality}, #{@defense})"
    if @units.any?
      unit_list = @units.map(&:to_s).join(' ')
      s + " units: #{unit_list} "
    else
      s
    end
  end
end
