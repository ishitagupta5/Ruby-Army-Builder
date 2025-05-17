#!/usr/bin/env ruby
# main.rb

require_relative 'Army'
require_relative 'Squad'
require_relative 'Hero'
require_relative 'Monster'
require_relative 'EnhancedUnit'
require_relative 'Unit'
require_relative 'Upgrade'

if ARGV.size != 2
  puts "Usage: ruby main.rb input.txt output.txt"
  exit 1
end

input_file, output_file = ARGV

curr_army          = nil
curr_squad         = nil
curr_enhanced_unit = nil
curr_unit          = nil

File.open(output_file, 'w') do |out|
  File.foreach(input_file) do |line|
    line.chomp!
    next if line.strip.empty?
    tok = line.split("\t").map(&:strip)

    case tok[0].upcase
    when 'ARMY:'
      name, player, faction = tok[1], tok[2], tok[3]
      curr_army = Army.new(name, player, faction)
      out.puts "Creating Army: #{name}, #{player}, #{faction}"
      out.puts "\t#{curr_army}"

    when 'SQUAD:'
      name = tok[1]
      curr_squad = Squad.new(name)
      out.puts "Creating Squad: #{name}"
      out.puts "\t#{curr_squad}"
      if curr_army
        curr_army.add_unit(curr_squad)
        out.puts "Adding Squad to Army"
        out.puts "\t#{curr_army}"
      end

    when 'HERO:'
      name, pts = tok[1], tok[2]
      curr_unit = Hero.new(name, pts)
      curr_enhanced_unit = curr_unit
      out.puts "Creating Hero: #{name}, #{pts}"
      out.puts "\t#{curr_unit}"
      if curr_squad
        curr_squad.add_unit(curr_unit)
        out.puts "Adding Hero to Squad"
        out.puts "\t#{curr_squad}"
      end

    when 'MONSTER:'
      name, pts = tok[1], tok[2]
      curr_unit = Monster.new(name, pts)
      curr_enhanced_unit = curr_unit
      out.puts "Creating Monster: #{name}, #{pts}"
      out.puts "\t#{curr_unit}"
      if curr_squad
        curr_squad.add_unit(curr_unit)
        out.puts "Adding Monster to Squad"
        out.puts "\t#{curr_squad}"
      end

    when 'ENHANCED UNIT:'
      name, pts, rule = tok[1], tok[2], tok[3]
      curr_enhanced_unit = EnhancedUnit.new(name, pts, rule)
      curr_unit = curr_enhanced_unit
      out.puts "Creating Enhanced Unit: #{name}, #{pts}"
      out.puts "\t#{curr_enhanced_unit}"
      if curr_squad
        curr_squad.add_unit(curr_enhanced_unit)
        out.puts "Adding Enhanced Unit to Squad"
        out.puts "\t#{curr_squad}"
      end

    when 'SPECIAL RULE:'
      new_rule = tok[1]
      if curr_enhanced_unit
        out.puts "Adding special rule #{new_rule} to #{curr_enhanced_unit}"
        curr_enhanced_unit.specialrule = new_rule
        out.puts "Added special rule #{new_rule} to #{curr_enhanced_unit}"
      end

    when 'UNIT:'
      name, pts = tok[1], tok[2]
      curr_unit = Unit.new(name, pts)
      out.puts "Creating Unit: #{name}, #{pts}"
      out.puts "\t#{curr_unit}"
      if curr_squad
        curr_squad.add_unit(curr_unit)
        out.puts "Adding Unit to Squad"
        out.puts "\t#{curr_squad}"
      end

    when 'UPGRADE:'
      name, pts = tok[1], tok[2]
      up = Upgrade.new(name, pts)
      out.puts "Creating Upgrade: #{name}, #{pts}"
      out.puts "\t#{up}"
      if curr_unit
        curr_unit.addUpgrade(up)
        out.puts "Adding Upgrade to Unit"
        out.puts "\t#{curr_unit}"
      end
    end
  end

    out.puts "Summary of final units"
    out.puts "Last army: #{curr_army}"               if curr_army
    if curr_squad
        out.puts "Last squad: #{curr_squad}"
      else
        out.puts "No squad found."
      end
    out.puts "Last enhanced unit: #{curr_enhanced_unit}" if curr_enhanced_unit
    out.puts "Last unit: #{curr_unit}"               if curr_unit
  end
  