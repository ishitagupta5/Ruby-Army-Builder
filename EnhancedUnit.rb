# EnhancedUnit.rb
# Extends Unit by allowing an optional special rule
require_relative 'Unit'

class EnhancedUnit < Unit
  attr_accessor :specialrule

  # Accepts optional specialrule when creating  
  def initialize(name, points, specialrule = nil)
    super(name, points)
    @specialrule = specialrule
  end

  # Include special rule in the string if present
  def to_s
    s = super
    s += " special rule: [#{@specialrule}]" if @specialrule
    s
  end
end
