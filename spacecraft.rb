require_relative 'motion/spacecraft_movement.rb'
require_relative 'motion/spacecraft_rotation.rb'
require_relative 'motion/spacecraft_angle.rb'

class Spacecraft

  include SpacecraftMovement
  include SpacecraftRotation
  include SpacecraftAngle

  attr_accessor :position, :direction, :prev_direction
  def initialize
    @position = [0, 0, 0]
    @direction = 'N'
    @prev_direction = nil
  end

  def execute_commands(commands)
    commands.each do |command|
      begin
        case command
        when 'f' then move_forward(@position, @direction)
        when 'b' then move_backward(@position, @direction)
        when 'l' then @direction = turn_left(@direction, @prev_direction)
        when 'r' then @direction = turn_right(@direction, @prev_direction)
        when 'u' then @direction, @prev_direction = turn_upward(@direction)
        when 'd' then @direction, @prev_direction = turn_downward(@direction)
        else
          raise ArgumentError, "Invalid command: #{command}"
        end
      rescue ArgumentError => e
        puts "Error: #{e.message}"
      end
    end
  end
end
