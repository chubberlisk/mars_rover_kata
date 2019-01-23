class MarsRover
  attr_reader :position, :direction

  def initialize(starting_position, facing_direction)
    @position = starting_position
    @direction = facing_direction
  end
end