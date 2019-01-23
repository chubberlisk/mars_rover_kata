class MarsRover
  attr_reader :position, :direction

  def initialize(starting_position, facing_direction)
    @position = starting_position
    @direction = facing_direction
  end

  def move(commands)
    commands.each do |command|
      if @direction == :north
        command == 'f' ? @position[:y] += 1 : @position[:y] -= 1
      elsif @direction == :east
        command == 'f' ? @position[:x] += 1 : @position[:x] -= 1
      elsif @direction == :south
        command == 'f' ? @position[:y] -= 1 :  @position[:y] += 1
      else
        command == 'f' ? @position[:x] -= 1 : @position[:x] += 1
      end
    end
  end
end