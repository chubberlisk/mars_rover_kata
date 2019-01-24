class MarsRover
  MOVEMENT = {
    :north => { 'f' => [:y, 1], 'b' => [:y, -1] },
    :east => { 'f' => [:x, 1], 'b' => [:x, -1] },
    :south => { 'f' => [:y, -1], 'b' => [:y, 1] },
    :west => { 'f' => [:x, -1], 'b' => [:x, 1] }
  }.freeze

  ROTATIONS = {
    :north => { 'l' => :west, 'r' => :east },
    :east => { 'l' => :north, 'r' => :south },
    :south => { 'l' => :east, 'r' => :west },
    :west => { 'l' => :south, 'r' => :north }
  }.freeze

  attr_reader :position, :direction

  def initialize(starting_position, facing_direction)
    @position = starting_position
    @direction = facing_direction
  end

  def move(commands)
    commands.each do |command|
      if command == 'f' || command == 'b'
        axis, change = MOVEMENT[@direction][command]
        @position[axis] += change
      else
        @direction = ROTATIONS[@direction][command]
      end
    end
  end
end